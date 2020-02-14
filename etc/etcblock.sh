#!/bin/bash
a=$((`curl -s --data '{"method":"eth_blockNumber","params":[],"id":1,"jsonrpc":"2.0"}' -H "Content-Type: application/json" -X POST localhost:8545 | grep -oh "\w*0x\w*"`))
b=$(curl -s https://api.nanopool.org/v1/etc/network/lastblocknumber | jq '.data'| awk 'gsub(/\,$/,X)1{ print "{\"text\":\"ETC Mainnet Latest: "$1"\"}"}')
curl -X POST -d "{\"text\":\"ETC Block Sync:"$a"\"}" https://hooks.slack.com/services/xxxx
curl -X POST -d "$b" https://hooks.slack.com/services/xxxx