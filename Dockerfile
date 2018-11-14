FROM docker:stable

RUN apk add --no-cache py-pip jq
RUN pip install --no-cache-dir docker-compose
