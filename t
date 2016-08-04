#!/bin/sh

SESSION=${1}
TASK_DIR=${HOME}/work/tasks
QUEUE_DIR=${TASK_DIR}/queue
SESSION_DIR=${QUEUE_DIR}/${SESSION}
SESSION_DESC=${2:-}

mkdir -p ${SESSION_DIR}

cd ${SESSION_DIR}

if [ -n "${SESSION_DESC}" ]
then
    echo "${SESSION_DESC}" > info
fi

screen -d -r ${SESSION} || screen -S ${SESSION}
