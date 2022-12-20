#!/bin/bash

# selection menu

# to use the default "#?" as the indicator for
# input, remove the PS3 line

PS3="File: "

select FILENAME in *; do
  case $FILENAME in
    *) echo "You picked $FILENAME"
  esac
done