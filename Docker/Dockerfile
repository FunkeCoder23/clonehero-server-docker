FROM alpine:latest
ARG CH_VERSION=v1.1.0.4261-PTB


RUN apk add --no-cache \
    libgcc \
    libstdc++ \
    libarchive-tools \
    && rm -rf /var/cache/apk/*

WORKDIR /tmp
RUN wget -qO- https://github.com/clonehero-game/releases/releases/download/${CH_VERSION}/CloneHero-StandaloneServer.zip | \
    bsdtar -xvf- 
WORKDIR /app
RUN find /tmp -name "linux-musl" -exec chmod +x {}/Server \; -exec mv {}/Server /app/ \; && \
    rm -rf /tmp/*
    
COPY /init /init
WORKDIR /data

ENTRYPOINT  ["/init/init.sh"]