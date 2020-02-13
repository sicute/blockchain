#!/bin/bash
a=$(bitcoinsv-cli -conf=/mnt/bsv/conf/bsv.conf getblockchaininfo | grep "blocks" | grep "blocks"|awk 'gsub(/\,$/,X)1{ print "{\"text\":\"BSV Latest Blocks Sync :"$2"\"}"}')
sleep 5
b=$(curl -s https://api.whatsonchain.com/v1/bsv/main/chain/info | jq '.blocks' | awk 'gsub(/\,$/,X)1{ print "{\"text\":\"BSV Mainnet: "$1"\"}"}')
sleep 5
curl -X POST -d "$a" https://hooks.slack.com/services/
sleep 5
curl -X POST -d "$b" https://hooks.slack.com/services/