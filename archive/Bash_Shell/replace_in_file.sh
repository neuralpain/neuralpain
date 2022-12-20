#!/bin/bash

# replacing a line in a file.

# https://stackoverflow.com/questions/11145270/how-to-replace-an-entire-line-in-a-text-file-by-line-number

FILE='replace_in_file.txt'

echo "Lorem ipsum dolor sit amet," > $FILE
echo "consectetur adipiscing elit." >> $FILE
echo "Duis eu diam non tortor laoreet" >> $FILE
echo "bibendum vitae et tellus." >> $FILE

sed -e '2s/.*/new text/' -i $FILE
#       ^
# where N should be replaced by your target line number. 
# This replaces the line in the original file.
# To save the changed text in a different file, drop the -i option:

# sed -e '2s/.*/new text/' $FILE