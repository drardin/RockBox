FROM --platform=linux/arm64/v8 ubuntu:22.04

RUN curl -k -L -o /etc/apt/sources.list.d/box64.list https://ryanfortner.github.io/box64-debs/box64.list && \
    curl -k -L https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y \
    apt-utils \
    curl \
    build-essential \
    unzip \
    rsync \
    box64-arm64 -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -k -L -o /etc/apt/sources.list.d/box64.list https://ryanfortner.github.io/box64-debs/box64.list && \
curl -k -L https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg


WORKDIR /LZ

COPY config.env /LZ/config.env
COPY bootstrap.sh /LZ/bootstrap.sh
COPY server.properties /LZ/server.properties

EXPOSE 19132/udp

ENTRYPOINT ["./bootstrap.sh"]