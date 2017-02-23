#!/usr/bin/env bash

directory=`dirname $0`
directory="$directory/src"

# Executes all files in the src directory recursively.
find $directory -name '*.sh' |
while read filename
do
  $filename
done
