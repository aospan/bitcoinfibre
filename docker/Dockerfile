FROM debian:stretch

RUN apt-get update && apt-get install -y \
      build-essential git cmake sudo vim autoconf automake libtool pkg-config \
      libdb-dev libdb++-dev libqt4-dev bsdmainutils libboost-all-dev libssl-dev \
      libprotobuf-dev libevent-dev \
      && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://github.com/aospan/bitcoinfibre.git /opt/bitcoinfibre

RUN cd /opt/bitcoinfibre && ./autogen.sh\
  && ./configure --with-incompatible-bdb \
  && make -j 4 && make install

COPY ./entrypoint.sh /
CMD ["/entrypoint.sh"]
