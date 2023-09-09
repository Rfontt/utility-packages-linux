#!/bin/bash

echo "The intelliji will be installed"

. ./utils.sh
. ./transform_app.sh
. ./extract_download_folder.sh

packageManager
installPackages "$command"

# Get the intelliji current version from an api
response=$(curl -sL "https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&type=release")
downloadUrl=$(echo "$response" | grep -oP '"linux":{"link":"\K[^"]+')

extractDownloadFolder "$downloadUrl"

intellij_dir="/opt/intellij-idea"

transformApp "$intellij_dir" "$intellij_dir/bin/idea.png" "$intellij_dir/bin/idea.sh" "idea-IU" "/usr/local/bin/idea" "intellij-idea" "Powerful IDE for Java development" "Development;IDE;" "jetbrains-idea"