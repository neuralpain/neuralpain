#!/bin/bash

set -x

# get files in directory
cd ..

file_list=$(ls)

for i in ${file_list[@]}; do 
  if [ -d $i ]; then
    dir_list+=$i
    unset ${file_list[1]}
  fi
done 

# echo
# echo ${file_list}
# echo ${dir_list[@]}