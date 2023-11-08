FROM --platform=linux/arm64/v8 ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y \
    apt-utils \
    curl \
    build-essential \
    unzip \
    rsync \
    tmux \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -k -L -o /etc/apt/sources.list.d/box64.list https://ryanfortner.github.io/box64-debs/box64.list && \
    curl -k -L https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg && \
    apt-get update && \
    apt-get install -y box64-arm64

WORKDIR /LZ

COPY config.env /LZ/config.env
COPY bootstrap.sh /LZ/bootstrap.sh
COPY logMonitor.sh /LZ/logMonitor.sh
COPY server.properties /LZ/server.properties
COPY BDS /usr/local/bin

EXPOSE 19132/udp

ENTRYPOINT ["./bootstrap.sh"]