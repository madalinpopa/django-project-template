"""
Production settings
"""
from .base import *

# GENERAL
# -----------------------------------------------------------------------------

DEBUG = False
ALLOWED_HOSTS = [
    "project.com",
    "*.project.com",
    "project.azurewebsites.net",
]

# SECURITY
# -----------------------------------------------------------------------------
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True
SECURE_BROWSER_XSS_FILTER = True
CSRF_TRUSTED_ORIGINS = ["https://*.project.com"]

# STATIC
# -----------------------------------------------------------------------------
STATICFILES_STORAGE = "project.backend.storage.AzureStaticStorage"
STATIC_URL = f"https://{AZURE_CUSTOM_DOMAIN}/{AZURE_STATIC_CONTAINER}/"

# MEDIA
# -----------------------------------------------------------------------------
DEFAULT_FILE_STORAGE = "project.backend.storage.AzureMediaStorage"
MEDIA_URL = f"https://{AZURE_CUSTOM_DOMAIN}/{AZURE_MEDIA_CONTAINER}/"

# DATABASES
# -----------------------------------------------------------------------------
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql_psycopg2",
        "NAME": os.getenv("DB_NAME"),
        "USER": os.getenv("DB_USER"),
        "PASSWORD": os.getenv("DB_PASS"),
        "HOST": os.getenv("DB_HOST"),
        "PORT": "",
        "OPTIONS": {
            "sslmode": "require",
        },
    }
}

# CORS Settings
# -----------------------------------------------------------------------------
# CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOWED_ORIGINS = []
