#!/usr/bin/env bash
bsv_pid=$(pgrep -f bitcoinsvd)
echo "Found bitcoin SV  pid: [${bsv_pid}]"

if [ -n "$(ps -p ${bsv_pid} -o pid=)" ]; then
    echo "Send SIGINT"
    kill -SIGINT ${bsv_pid}
fi

while [ -n "$(ps -p ${bsv_pid} -o pid=)" ]
do
    sleep 1
done
echo "Process bitcoin SV daemon has finished"
