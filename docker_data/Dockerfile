FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV APP_HOME=/LZ

RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    curl \
    python3 \
    jq \
    build-essential \
    git \
    cmake \
    unzip \
    rsync \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ptitSeb/box64.git /opt/box64 \
    && cd /opt/box64 \
    && cmake . \
    && make

WORKDIR $APP_HOME

COPY config.env $APP_HOME/config.env
COPY bootstrap.sh $APP_HOME/bootstrap.sh
COPY server.properties $APP_HOME/server.properties

EXPOSE 19132/udp

#ENTRYPOINT ["/opt/box64/box64", "/LZ/bootstrap.sh"]
ENTRYPOINT ["/bin/bash"]