#!/bin/bash

if [[ "$1" == "" ]]; then
  echo "Syntax: create-feature-env.sh ENV_NAME"
  exit 1
fi

if [[ ! -d featureenvs/$1 ]]; then
  mkdir -p featureenvs/$1
  cd featureenvs/$1
  git submodule add https://github.com/mikogs/project-template-apps-node.git node
  cd ../../
else
  git submodule update featureenvs/$1/node
fi

cd featureenvs/$1
cp ../template/kustomization.yaml .
sed -i "s|FEATURE_ENV_NAME|$1|g" "kustomization.yaml"
