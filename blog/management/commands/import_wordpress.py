import os
from urllib.parse import urlparse

import requests
from bs4 import BeautifulSoup
from dateutil import parser as dateparser
from defusedxml.ElementTree import parse

from django.core.management.base import BaseCommand
from django.core.files.base import ContentFile

from wagtail.models import Page
from wagtail.images import get_image_model

from blog.models import BlogIndexPage, BlogPage


class Command(BaseCommand):
    help = "Import WordPress WXR XML into Wagtail BlogPage."

    def add_arguments(self, parser):
        parser.add_argument("xml_path", help="Path to WordPress export XML (WXR)")
        parser.add_argument("--blog-slug", default="blog", help="Slug of BlogIndexPage (default: blog)")
        parser.add_argument("--download-media", action="store_true", help="Download <img> and create Wagtail Images")
        parser.add_argument("--media-base-url", default="", help="Prefix for relative media URLs (e.g. https://site.com)")

    def handle(self, *args, **opts):
        xml_path = opts["xml_path"]
        if not os.path.exists(xml_path):
            raise SystemExit(f"XML not found: {xml_path}")

        ns = {
            "wp": "http://wordpress.org/export/1.2/",
            "content": "http://purl.org/rss/1.0/modules/content/",
        }

        root_page = Page.get_first_root_node().specific

        # Find (or create) BlogIndexPage
        blog_index = None
        for c in root_page.get_children().specific():
            if isinstance(c, BlogIndexPage) and c.slug == opts["blog_slug"]:
                blog_index = c
                break

        if blog_index is None:
            blog_index = BlogIndexPage(title="Blog", slug=opts["blog_slug"])
            root_page.add_child(instance=blog_index)
            blog_index.save_revision().publish()
            self.stdout.write(self.style.SUCCESS("Created BlogIndexPage"))

        Image = get_image_model()

        tree = parse(xml_path)
        root = tree.getroot()
        items = root.findall(".//item")

        created, skipped = 0, 0

        for item in items:
            post_type = (item.findtext("wp:post_type", default="", namespaces=ns) or "").strip()
            status = (item.findtext("wp:status", default="", namespaces=ns) or "").strip()
            if post_type != "post" or status != "publish":
                continue

            title = (item.findtext("title", default="") or "").strip()
            slug = (item.findtext("wp:post_name", default="", namespaces=ns) or "").strip()
            date_str = (item.findtext("wp:post_date", default="", namespaces=ns) or "").strip()
            html = item.findtext("content:encoded", default="", namespaces=ns) or ""

            if not slug:
                # fallback slug
                slug = "post-" + str(created + skipped + 1)

            if blog_index.get_children().filter(slug=slug).exists():
                skipped += 1
                continue

            if opts["download_media"]:
                html = self._download_and_replace_images(html, Image, opts["media_base_url"].rstrip("/"))

            page = BlogPage(
                title=title or slug,
                slug=slug,
                body=html,
            )

            if date_str:
                try:
                    page.date = dateparser.parse(date_str).date()
                except Exception:
                    pass

            blog_index.add_child(instance=page)
            page.save_revision().publish()
            created += 1

        self.stdout.write(self.style.SUCCESS(f"Import finished. created={created}, skipped={skipped}"))

    def _download_and_replace_images(self, html: str, Image, media_base_url: str) -> str:
        soup = BeautifulSoup(html, "html.parser")
        for img in soup.find_all("img"):
            src = img.get("src")
            if not src:
                continue

            if src.startswith("/") and media_base_url:
                url = media_base_url + src
            else:
                url = src

            try:
                r = requests.get(url, timeout=30)
                r.raise_for_status()
            except Exception:
                continue

            filename = os.path.basename(urlparse(url).path) or "image.jpg"
            wagtail_image = Image(title=filename)
            wagtail_image.file.save(filename, ContentFile(r.content), save=True)

            try:
                img["src"] = wagtail_image.file.url
            except Exception:
                pass

        return str(soup)