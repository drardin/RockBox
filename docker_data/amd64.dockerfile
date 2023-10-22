FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV APP_HOME=/LZ

RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    curl \
    build-essential \
    unzip \
    rsync \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR $APP_HOME

COPY config.env $APP_HOME/config.env
COPY bootstrap.sh $APP_HOME/bootstrap.sh
COPY server.properties $APP_HOME/server.properties

EXPOSE 19132/udp

ENTRYPOINT ["./bootstrap.sh"]