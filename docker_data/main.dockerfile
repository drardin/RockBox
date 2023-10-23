FROM ubuntu:22.04

ARG TARGETARCH

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y \
    apt-utils \
    curl \
    build-essential \
    unzip \
    rsync \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN if [ "$TARGETARCH" = "arm64" ] ; then \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y debian-keyring && \
    curl -L https://ryanfortner.github.io/box64-debs/box64.list -o /etc/apt/sources.list.d/box64.list && \
    curl -L https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y box64-generic-arm \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* ;\
    fi

WORKDIR /LZ

COPY config.env /LZ/config.env
COPY bootstrap.sh /LZ/bootstrap.sh
COPY server.properties /LZ/server.properties

EXPOSE 19132/udp

ENTRYPOINT ["./bootstrap.sh"]