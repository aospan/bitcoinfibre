#!/bin/bash
set -e

trap 'kill -TERM $PID; wait $PID' TERM INT

#wait until /tmp/async_rx appear
while [ ! -e /tmp/async_rx ]
do
  printf "Waiting /tmp/async_rx ... \n"
  sleep 1
done

#start bitcoind
/opt/bitcoinfibre/src/bitcoind -fecreaddevice=/tmp/async_rx -fecstat=60 \
  -conf=/opt/bitcoin/bitcoin.conf -datadir=/opt/bitcoin/ &
PID=$!
wait $PID
trap - TERM INT
wait $PID
EXIT_STATUS=$?
