FROM python:3.9.7-slim

WORKDIR /app

COPY . .

RUN python -m venv /opt/venv

RUN /opt/venv/bin/pip install --upgrade pip

RUN apt-get update \
    && apt-get -y install libpq-dev gcc

RUN /opt/venv/bin/pip install -r requirements.txt

RUN chmod +x entrypoint.sh

CMD [ "/app/entrypoint.sh" ]