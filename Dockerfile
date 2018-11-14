FROM docker:stable

RUN apk add --no-cache py-pip jq bash curl
RUN pip install --no-cache-dir docker-compose
SHELL ["/bin/bash", "-c"]
