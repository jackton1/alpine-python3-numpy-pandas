FROM python:3.6-alpine

MAINTAINER Tonye Jack <jtonye@ymail.com>

ENV PYTHONUNBUFFERED 1

ADD requirements.txt /requirements.txt

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
        libstdc++ \
        python3-dev \
        fontconfig \
    && apk add --no-cache --virtual .build-deps \
        g++ \
        gcc \
        make \
        libc-dev \
        libffi-dev \
        openssl-dev \
        ca-certificates \
        libxml2-dev \
        libxslt-dev \
        libjpeg-turbo-dev \
        zlib-dev  \
        musl-dev \
        linux-headers \
        pcre-dev \
        curl \
        git \
        chromium \
        chromium-chromedriver \
    && update-ca-certificates 2>/dev/null || true \
    && pip3.6 install -U pip==9.0.3 \
    && pip3.6 install --no-cache-dir -r requirements.txt \
    && apk del .build-deps
