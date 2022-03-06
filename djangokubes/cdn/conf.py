from decouple import config

AWS_ACCESS_KEY_ID = config("AWS_ACCESS_KEY_ID", default="")
AWS_SECRET_ACCESS_KEY = config("AWS_SECRET_ACCESS_KEY", default="")
AWS_STORAGE_BUCKET_NAME = "django-assets"
AWS_S3_ENDPOINT_URL = "https://nyc3.digitaloceanspaces.com"
AWS_S3_OBJECT_PARAMETERS = {
  "CacheControl": "max-age=86400",
  "ACL": "public-read"
}

AWS_LOCATION = "https://django-assets.nyc3.digitaloceanspaces.com"
DEFAULT_FILE_STORAGE = "djangokubes.cdn.backends.MediaRootS3BotoStorage"
STATICFILES_STORAGE = "djangokubes.cdn.backends.StaticRootS3BotoStorage"