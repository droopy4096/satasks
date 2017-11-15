#!/bin/sh

while getopts ":cx" opt
do
  case $opt in
    c) COMPLETE=1
      ;;
    x) TERMINATE=1
      ;;
    *) COMPLETE=0
       TERMINATE=0
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

if [ "${TERMINATE}" = "1" ]
then
  screen -S ${SESSION} -X quit

else
  mkdir -p ${SESSION_DIR}

  cd ${SESSION_DIR}

  if [ -n "${SESSION_DESC}" ]
  then
      echo "${SESSION_DESC}" > info
  fi


  screen -d -r ${SESSION} || screen -S ${SESSION}
fi

if [ "$COMPLETE" = "1" ] 
then
  cmd="mv $SESSION_DIR $FINISHED_SESSION_DIR"
  echo $cmd
  $cmd
  exit 0
fi

