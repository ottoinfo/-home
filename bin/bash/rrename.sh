#!/bin/bash

# There must be two command line parameters
# If not, display message and exit
if [ $# -ne 2 ]
then
  echo Usage: $0 old_extension new_extension
  echo Example: $0 txt xml
  exit 1
fi

# How many file were renamed
filecount=0

# For each matching extension...
for filename in `find ${PWD} -name "*.$1"`
  do
    # Move file Strip off part of filename matching 1st argument,
    # then append 2nd argument.
    mv $filename ${filename%$1}$2
	echo ${filename%$1}$2
    ((filecount++))
  done

echo Renamed $filecount files

exit 0