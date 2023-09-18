#!/bin/bash

temp_dir=$(mktemp -d -p "$HOME" packages.XXXXXX)

. ./packagesProvider.sh
. ./transformToApp.sh
. ./extractDownloadFolder.sh

packageManager
installPackages

response=$(curl -sL "https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&type=release")
downloadUrl=$(echo "$response" | grep -oP '"linux":{"link":"\K[^"]+')

extractDownloadFolder "$downloadUrl" "$temp_dir"

intellij_dir="/opt/intellij-idea"

transformToApp "$intellij_dir" "$intellij_dir/bin/idea.png" "$intellij_dir/bin/idea.sh" "idea-IU" "/usr/local/bin/idea" "intellij-idea" "Powerful IDE for Java development" "Development;IDE;" "jetbrains-idea"

rm -rf "$temp_dir"