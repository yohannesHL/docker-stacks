#!/usr/bin/zsh

if [ -z "$STACKS_BASE" ]; then
  echo "Setting STACKS_BASE env var"
  echo "export STACKS_BASE=$PWD/stacks" >> ~/.zshrc
fi

source ~/.zshrc


cp bin/dstack $HOME/.local/bin/dstack
