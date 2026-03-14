FROM alpine:latest
ARG CH_VERSION=V1.0.0.4080 

RUN apk add --no-cache \
    libgcc \
    libstdc++ \
    && rm -rf /var/cache/apk/*

WORKDIR /app
    RUN wget -qO- https://github.com/clonehero-game/releases/releases/download/V1.0.0.4080/CloneHero-standalone_server.zip |\
    unzip -j -  ChStandaloneServer-v1.0.0.4080-final/linux-musl/Server && \
    chmod +x Server
    COPY /init /init
WORKDIR /data

ENTRYPOINT  ["/init/init.sh"]