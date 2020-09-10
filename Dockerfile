FROM docker:18 as base
LABEL maintainer="Adam Wallis <adam.wallis@gmail.com>"
RUN set -ex \
    && apk add --no-cache\
         python3\
         jq\
         bash\
         curl\
    && rm -rf /var/cache/apk/*
ENV PATH=/root/.local/bin:"${PATH}"
SHELL ["/bin/bash", "-c"]

FROM base as builder
RUN set -ex \
    && apk add \
         py3-pip\
         build-base\
         python3-dev\
         libffi-dev\
         openssl-dev
RUN pip3 install -U pip setuptools
RUN pip3 install --user docker-compose

FROM base as final
COPY --from=builder /root/.local/ /root/.local/