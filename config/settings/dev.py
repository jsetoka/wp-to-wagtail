from .base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "django-insecure-dasg7+r=9_z6enw*ipvv@nz)$_b^likl*)-738q0+v(vn#5-6f"

# SECURITY WARNING: define the correct hosts in production!
ALLOWED_HOSTS = ["*"]

EMAIL_BACKEND = "django.core.mail.backends.console.EmailBackend"

DATABASES = {
     "default": {
         "ENGINE": "django.db.backends.sqlite3",
         "NAME": BASE_DIR / "db.sqlite3",
     }
}
DATABASES = {
  "default": {
    "ENGINE": "django.db.backends.postgresql",
    "NAME": "wagtail",
    "USER": "wagtail",
    "PASSWORD": "wagtail",
    "HOST": "wp-to-wagtail-db-1",
    "PORT": "5432",
  }
}



try:
    from .local import *
except ImportError:
    pass
