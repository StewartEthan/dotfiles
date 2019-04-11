#!/bin/zsh

# branch=`git rev-parse --abbrev-ref HEAD`;
remote="origin";
branch="master";
branchSet=false;

while getopts "cr:b:" opt; do
  case $opt in
    c)
      if [ $branchSet = true ]; then
        echo -e "\033[91mOnly use the -c arg, or the -b arg with the name of your branch\033[0m";
      else
        branch=`git rev-parse --abbrev-ref HEAD`;
        branchSet=true;
      fi
      ;;
    r)
      remote=$OPTARG;
      ;;
    b)
      if [ $branchSet = true ]; then
        echo -e "\033[91mOnly use the -c arg, or the -b arg with the name of your branch\033[0m";
      else
        branch=$OPTARG;
        branchSet=true;
      fi
      ;;
  esac
done

git fetch origin;
echo -e "\033[96mFetched from $remote";
echo -e "About to rebase with $remote/$branch\033[0m";
git rebase $remote/$branch;
echo -e "\033[96mRebase finished\033[0m";
