#!/bin/bash

echo "The intelliji will be installed"

. ./utils.sh

packageManager
installPackates "$command"

# Get the intelliji current version from an api
response=$(curl -sL "https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&type=release")
downloadUrl=$(echo "$response" | grep -oP '"linux":{"link":"\K[^"]+')
filename=$(echo "$downloadUrl" | grep -oP '/[^/]+\.tar.gz$' | tail -n1)
path="$HOME/Documentos/packages_test"

cd $path

# wget "$downloadUrl"

# tar -xvf $filename
