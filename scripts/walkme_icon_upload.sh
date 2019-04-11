#!/bin/bash

##########################################################
# Uploads an image to S3                                 #
# Used to provide convenient static URLs for WalkMe to   #
# use to get icons                                       #
#                                                        #
# Options:                                               #
# -f : filename (required)                               #
# -x : hours browsers should cache icon (default 24)     #
##########################################################

filename="";
cacheLength=24;

while getopts 'f:x:' opt; do
  case "${opt}" in
    f) filename=$OPTARG ;;
    i) cacheLength=$OPTARG ;;
  esac
done

# Not allowed to use without a filename
if [ -z "$filename" ]; then
  echo -e "\033[31mYou must provide a filename to use this command\033[0m";
  exit 1;
fi

cake -x $cacheLength -f $filename doc:upload;
