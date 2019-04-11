#!/bin/bash

################################################################################
# This script creates a new file with the name provided as an argument, gives  #
# it executable permission (744), and opens it in vim for editing              #
################################################################################

# Ensure a filename was provided
if [[ $# -le 0 ]]; then
  echo "Usage: tscript <filename>";
  exit 1;
fi

# Only continue if error didn't occur"

# Put a basic bash script template in the new file
cat ~/scripts/template.sh > ~/scripts/$1.sh;

# Give the new script file executable permission
chmod 744 ~/scripts/$1.sh;

# Open the new script file in vim
vim ~/scripts/$1.sh;
