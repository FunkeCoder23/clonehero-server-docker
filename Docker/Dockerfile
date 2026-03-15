FROM alpine:latest
ARG CH_VERSION=v1.1.0.4261-PTB


RUN apk add --no-cache \
    libgcc \
    libstdc++ \
    && rm -rf /var/cache/apk/*

WORKDIR /app
RUN wget -qO- https://github.com/clonehero-game/releases/releases/download/${CH_VERSION}/CloneHero-StandaloneServer.zip | \
    unzip -j -  CloneHero-StandaloneServer/linux-musl/Server && \
    chmod +x Server
COPY /init /init
WORKDIR /data

ENTRYPOINT  ["/init/init.sh"]