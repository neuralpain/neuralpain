#!/bin/bash

# collect arguments to an array,
# remove the first argument then return
# a list of the arguments in a TXT file.

ARGS=$@
LIST=${ARGS[@]/"$1"}

for i in ${LIST[@]}; do
  echo ${LIST[@]}
done

for i in ${LIST[@]}; do
  echo $i >> LIST.txt
done