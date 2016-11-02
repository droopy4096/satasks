#!/bin/sh

while getopts ":c" opt
do
  case $opt in
    c) COMPLETE=1
      ;;
    *) COMPLETE=0
      ;;
  esac
done

shift "$((OPTIND-1))"

SESSION=${1}
TASK_DIR=${HOME}/work/tasks
QUEUE_DIR=${TASK_DIR}/queue
COMPLETED_DIR=${TASK_DIR}/completed
SESSION_DIR=${QUEUE_DIR}/${SESSION}
FINISHED_SESSION_DIR=${COMPLETED_DIR}/${SESSION}
SESSION_DESC=${2:-}

mkdir -p ${SESSION_DIR}

cd ${SESSION_DIR}

if [ -n "${SESSION_DESC}" ]
then
    echo "${SESSION_DESC}" > info
fi


screen -d -r ${SESSION} || screen -S ${SESSION}

if [ "$COMPLETE" = "1" ] 
then
  cmd="mv $SESSION_DIR $FINISHED_SESSION_DIR"
  echo $cmd
  $cmd
  exit 0
fi

