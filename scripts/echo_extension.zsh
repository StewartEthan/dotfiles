#!/bin/zsh

typeset -A colorCodes;
# colorCodes=(
colorCodes["black"]=30;
colorCodes["red"]=31;
colorCodes["green"]=32;
colorCodes["yellow"]=33;
colorCodes["blue"]=34;
colorCodes["magenta"]=35;
colorCodes["cyan"]=36;
colorCodes["light-gray"]=37;
colorCodes["dark-gray"]=90;
colorCodes["light-red"]=91;
colorCodes["light-green"]=92;
colorCodes["light-yellow"]=93;
colorCodes["light-blue"]=94;
colorCodes["light-magenta"]=95;
colorCodes["light-cyan"]=96;
colorCodes["white"]=97;
colorCodes["default"]=39;
# );

while getopts "c:" opt; do
  case $opt in
    c)
      colorNum=$colorCodes["$OPTARG:l"];
      ;;
  esac

  echoStr=""
  for arg in "${@[3,-1]}"
  do
    echoStr="$echoStr $arg";
  done
  echo "\033[${colorNum}m$echoStr\033[0m";
done
