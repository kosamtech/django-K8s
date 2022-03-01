#!/bin/bash

SUPERUSER_EMAIL = ${DJANGO_SUPERUSER_EMAIL:-"admin@gmail.com"}
SUPERUSER_USERNAME = ${DJANGO_SUPERUSER_USERNAME:-"admin"}
SUPERUSER_PASSWORD = ${DJANGO_SUPERUSER_PASSWORD:-"password"}

cd /app

/opt/venv/bin/python manage.py migrate --noinput

/opt/venv/bin/python manage.py createsuperuser --username =$SUPERUSER_USERNAME --email = $SUPERUSER_EMAIL --noinput || true