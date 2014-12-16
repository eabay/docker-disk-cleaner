#!/bin/sh -u

VOLUME=/data
DELETE_COUNT=${DELETE_COUNT:-5}
DELAY_TIME=${DELAY_TIME:-60}


while [ 1 ]
do
    echo "=> Getting free space on $VOLUME"
    freespace=$(df -P ${VOLUME} | awk 'NR==2{print $4}')

    echo "   ${freespace} KB available"

    if [ "$freespace" -lt "$MIN_FREE_SPACE" ]; then
        echo "=> Not enough free space, getting oldest $DELETE_COUNT files"

        for file in `find ${VOLUME} -type f -printf "%T@ %Tc %p\n" | sort -n | head -n ${DELETE_COUNT} | awk '{ print $NF }'`; do
            echo "   Deleting file ${file}"
            rm -f ${file}
        done
    else
        echo "=> Enough free space, nothing to do"
    fi

    echo "=> Going to sleep for ${DELAY_TIME} seconds"

    sleep ${DELAY_TIME}
done
