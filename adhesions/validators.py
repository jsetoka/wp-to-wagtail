# adhesions/validators.py

import os
from django.core.exceptions import ValidationError


def validate_file_extension(file):
    valid_extensions = [".pdf", ".jpg", ".jpeg", ".png"]
    ext = os.path.splitext(file.name)[1].lower()
    if ext not in valid_extensions:
        raise ValidationError("Extension non autorisée.")


def validate_file_size(file):
    max_size = 10 * 1024 * 1024
    if file.size > max_size:
        raise ValidationError("Fichier trop volumineux (max 10 Mo).")