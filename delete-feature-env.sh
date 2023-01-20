#!/bin/bash

if [[ "$1" == "" ]]; then
  echo "Syntax: delete-feature-env.sh ENV_NAME"
  exit 1
fi

if [[ -d featureenvs/$1 ]]; then
  git rm -r featureenvs/$1
  rm -rf .git/modules/featureenvs/$1
  git config --remove-section submodule."featureenvs/$1/node"
  git config --remove-section submodule."featureenvs/$1/frontend"
fi
