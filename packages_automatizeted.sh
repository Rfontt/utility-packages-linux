#!/bin/bash

echo "The intelliji will be installed"

sudo pacman -Syu

# packages=("grep", "curl", "wget", "tar", "jdk-openjdk")
packages=("grep", "curl", "wget", "tar")

for package in "${packages[@]}"; do
    if package -Q "$package" > /dev/null 2>&1; then
        echo "$package already exists."
    else
        sudo pacman -S "$package"
    fi
done

# Get the intelliji current version from an api
response=$(curl -sL "https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&type=release")
downloadUrl=$(echo "$response" | grep -oP '"linux":{"link":"\K[^"]+')
filename=$(echo "$downloadUrl" | grep -oP '/[^/]+\.tar.gz$' | tail -n1)
path="$HOME/Documentos/packages_test"

cd $path

wget "$downloadUrl"

tar -xvf $filename
