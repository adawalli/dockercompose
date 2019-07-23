FROM docker:18

RUN set -ex \
    && apk add --no-cache\
         python\
         jq\
         bash\
         curl\
    && rm -rf /var/cache/apk/*
SHELL ["/bin/bash", "-c"]
RUN set -ex \
    && apk add --no-cache --virtual .build-deps\
         py-pip\
         build-base\
         python-dev\
         libffi-dev\
         openssl-dev\
    && pip install --no-cache-dir docker-compose\
    && apk del .build-deps\
    && rm -rf /var/cache/apk/*
