FROM --platform=linux/amd64 ubuntu:22.04

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

WORKDIR /LZ

COPY config.env /LZ/config.env
COPY bootstrap.sh /LZ/bootstrap.sh
COPY logMonitor.sh /LZ/logMonitor.sh
COPY server.properties /LZ/server.properties
COPY BDS /usr/local/bin

EXPOSE 19132/udp

ENTRYPOINT ["./bootstrap.sh"]