
FROM python:3.8-slim
WORKDIR /root
COPY requirements.txt /root
RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2 \
    && pip install --upgrade pip \
    && pip install -r requirements.txt