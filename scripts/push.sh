#!/bin/bash

##########################################################
# Gets the current branch and pushes to the              #
# corresponding remote branch                            #
#                                                        #
# Options:                                               #
# -f : Force, works as -f flag in git push               #
# -i : Initial, sets upstream branch for new branches    #
##########################################################

branch=`git rev-parse --abbrev-ref HEAD`;
doforce=false;
firstpush=false;

while getopts 'fi' flag; do
  case "${flag}" in
    f) doforce=true ;;
    i) firstpush=true ;; # To signal whether to set the upstream branch as well
  esac
done

echo -e "\033[96mPushing to branch $branch\033[0m";

if [ $doforce = true ]; then
  git push origin $branch:$branch -f;
else
  git push origin $branch:$branch;
fi

if [ $firstpush = true ]; then
  git branch --set-upstream-to "origin/$branch";
fi
