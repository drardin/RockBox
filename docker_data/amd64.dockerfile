FROM --platform=linux/amd64 ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y \
    apt-utils \
    curl \
    build-essential \
    unzip \
    rsync \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /LZ

COPY config.env /LZ/config.env
COPY bootstrap.sh /LZ/bootstrap.sh
COPY server.properties /LZ/server.properties

EXPOSE 19132/udp

ENTRYPOINT ["./bootstrap.sh"]