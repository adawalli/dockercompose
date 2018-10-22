FROM docker:stable

RUN apk add --no-cache py-pip
RUN pip install docker-compose
