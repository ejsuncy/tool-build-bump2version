FROM python:3.8-alpine

LABEL org.opencontainers.image.source = "https://github.com/ejsuncy/tool-build-bump2version"

COPY requirements.txt /tmp

RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt

WORKDIR /bump
