#!/bin/bash

echo "Num args: $#";

for arg in "$@"
do
  echo $arg
done

getopts
