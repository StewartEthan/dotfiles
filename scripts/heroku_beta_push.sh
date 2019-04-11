#!/bin/bash

##########################################################
# Gets the current branch and pushes to                  #
# master on Heroku (fs-ask-beta)                         #
#                                                        #
# Options:                                               #
# -f : Force, works as -f flag in git push               #
##########################################################

branch=`git rev-parse --abbrev-ref HEAD`;
doforce=false;

while getopts 'fi' flag; do
  case "${flag}" in
    f) doforce=true ;;
  esac
done

echo -e "\033[96mPushing to beta through Heroku\033[0m";

if [ $doforce = true ]; then
  git push heroku-beta $branch:master -f;
else
  git push heroku-beta $branch:master;
fi
