#!/bin/bash
set -e

#wait until /tmp/async_rx appear
while [ ! -e /tmp/async_rx ]
do
  printf "Waiting /tmp/async_rx ... \n"
  sleep 1
done

#start bitcoind
/opt/bitcoinfibre/src/bitcoind -fecreaddevice=/tmp/async_rx -fecstat=60 \
  -conf=/opt/bitcoin/bitcoin.conf -datadir=/opt/bitcoin/
