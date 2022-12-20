#!/bin/bash

# echo a carriage return with \r

seq 1 1000000 | while read i; do echo -en "\r$i"; done

# from man echo:

# -n     do not output the trailing newline
# -e     enable interpretation of backslash escapes
# \r     carriage return