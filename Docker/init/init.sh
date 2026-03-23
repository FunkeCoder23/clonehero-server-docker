#!/bin/ash
set -euo pipefail
[ ! $SERVER_NAME  ] && echo "SERVER_NAME must be set" && exit 1

if [ ! $PASSWORD  ]; then
    PASS_OPT="--nopass"
else
    PASS_OPT="--password $PASSWORD"
fi

LOG_OPT="--logLevel ${LOG_LEVEL:-4}"

PORT=${PORT:-"14242"}
ADDRESS=${ADDRESS:-"0.0.0.0"}

SERVER_NAME_OPT="--name $SERVER_NAME"
ADDRESS_OPT="--address $ADDRESS"
PORT_OPT="--port $PORT"

exec /app/Server $SERVER_NAME_OPT $PASS_OPT $PORT_OPT $ADDRESS_OPT $LOG_OPT