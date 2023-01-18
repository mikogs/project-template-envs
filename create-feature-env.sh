#!/bin/bash

if [[ "$1" == "" ]]; then
  echo "Syntax: create-feature-env.sh ENV_NAME"
  exit 1
fi

mkdir -p featureenvs/$1
cd featureenvs/$1
git submodule add https://github.com/mikogs/project-template-apps-node.git node
cp ../template/kustomization.yaml .
sed -i "s|FEATURE_ENV_NAME|$1|g" "kustomization.yaml"
