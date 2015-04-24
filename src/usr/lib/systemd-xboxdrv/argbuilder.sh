#!/bin/sh

CONFIGPATH="/etc/default/xboxdrv"
RUNPATH="/var/run/xboxdrv/"
DEVPATH="$1"
ID="$(ls ${RUNPATH}/${DEVPATH})"

ARGS="--config ${CONFIGPATH}/${ID}.xboxdrv"
for configfile in ${CONFIGPATH}/${ID}/*; do
    if [ "${configfile}" = "${CONFIGPATH}/${ID}/config0.xboxdrv" ]; then
        ARGS="$ARGS --config $configfile"
    else
        ARGS="$ARGS --alt-config $configfile"
    fi
done
echo $ARGS > /var/run/xboxdrv/${DEVPATH}/args
