
if [ -f ~/.fs_tools ]; then
  source ~/.fs_tools
fi

# Helper functions
gitBranchDeleteFunc() {
  git branch -D $1;
}

hardResetHerokuFunc() {
  brew uninstall --force heroku;
  brew install heroku;
}

mdFunc() {
  mkdir $1;
  cd $1;
}

nresFunc() {
  sleep 3; # Give it a few seconds to get stopping
  clear; # For sanity

  # Killing all node processes three times seems to be the only way I can almost always
  # guarantee that they all die. Not sure why, but it works. Sleeps in between just to
  # briefly space the output from each
  killall node;
  sleep 0.5;
  killall node;
  sleep 0.5;
  killall node;

  echo; # Newline between `killall node` outputs and gulp output
  gulp; # Start the app
}

nodeVersionsFunc() {
  echo "node `node --version`\nnpm  v`npm --version`";
}

setGitUpstreamFunc() {
  branch=`git rev-parse --abbrev-ref HEAD`;
  # TODO: Possibly make origin configurable via args
  git branch --set-upstream-to "origin/$branch";
}

# Make the prompt easier to read
# PS1="\u: \w\n$ ";

# Git shortcuts
alias emptycommit="git commit --allow-empty -m \"force build\"";
alias gb="git branch";
alias gbd="gitBranchDeleteFunc";
alias gbup="setGitUpstreamFunc";
alias gc-="git checkout -";
alias gphb="~/scripts/heroku_beta_push.sh";
alias gpom="~/scripts/push.sh";
alias gstat="git status";
alias gst="gstat";
alias upstream="~/scripts/upstream.zsh";

# FamilySearch shortcuts
alias gwatch="gulp watch";
alias hlocal="heroku local";
alias hreset="hardResetHerokuFunc";
alias nres="nresFunc";
alias s3icon="~/scripts/walkme_icon_upload.sh";

# Navigation shortcuts
alias cd.="cd ..";
alias cd-="cd -";
alias cdln="cd ~/sandbox/learnnode/delicious";
alias md="mdFunc";

# Misc shortcuts
alias battery="pmset -g batt";
alias check5000="lsof -i -n -P | grep TCP | grep 5000";
alias clr="clear";
alias lla="ls -la";
#alias md="mkdir";
alias nv="nodeVersionsFunc";
alias refresh="source ~/.bash_profile";

# Script shortcuts
alias tscript="~/scripts/create_script.sh";
# source ~/.git-completion.sh

# Exports
export TARGET_ENV=local
