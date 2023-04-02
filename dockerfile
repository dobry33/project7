# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /srv/app

RUN pip3 install --upgrade pip
#RUN apt update && apt install install libpq-dev

RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt


CMD [ "python3", "web.py"]
