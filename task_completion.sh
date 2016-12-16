#!/bin/bash

_TaskCompletion(){
  local cur
  COMPREPLY=()   # Array variable storing the possible completions.
  cur=${COMP_WORDS[COMP_CWORD]}

  TASKS=$(task_list | cut -b 3- | cut -f 1)
  COMPREPLY=($(compgen -W "${TASKS}" -- ${cur} ))
}

