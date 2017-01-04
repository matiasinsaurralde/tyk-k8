#!/bin/bash


HOSTS=( "$@" )
PORT=6379
TRIB_COMMAND="echo \"yes\" | /usr/bin/redis-trib create --replicas 1 "


for i in "${HOSTS[@]}"; do
    if [[ "${i}" == "&&" ]]; then
        break;
    fi
    IP=$(getent hosts ${i} | tail -1 | awk '{print $1}' 2>&1)

    if [[ "${IP}" != "" ]]; then
        TRIB_COMMAND+="${IP}:${PORT} "
    fi
done

echo ${TRIB_COMMAND}
eval $TRIB_COMMAND