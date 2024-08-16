#!/bin/sh

if [ ! -f /node/data/CURRENT ]; then
  echo Node data missing. Copying from template...
  cp -r /node/template/* /node/data
  echo Template copied
else
  echo Node data exists
fi

npx ganache \
  --server.host 0.0.0.0 \
  --miner.blockTime 2 \
  --database.dbPath data \
  --wallet.seed seed \
  --server.port 8545 \
  --chain.chainId 1337 \
  --logging.debug true \
  --logging.verbose true \
  --server.ws true
