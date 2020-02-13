DATADIR="/mnt/bsv"
BSVBINDIR="/usr/local/bin"
$DATADIR/bsvstop.sh
echo -e "Starting Bitcoin SV  Node \n";
ulimit -c unlimited
ulimit -n 65535
ulimit -s 64000
$BSVBINDIR/bitcoinsvd -conf=$DATADIR/conf/bsv.conf -pid=$DATADIR/bsv.pid -daemon