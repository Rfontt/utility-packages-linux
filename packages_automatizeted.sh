#!/bin/bash

echo "The intelliji will be installed"

. ./utils.sh

packageManager
installPackates "$command"

# Get the intelliji current version from an api
response=$(curl -sL "https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&type=release")
downloadUrl=$(echo "$response" | grep -oP '"linux":{"link":"\K[^"]+')
filename=$(echo "$downloadUrl" | grep -oP '/\K[^/]+\.tar\.gz$')
path="$HOME/Documentos/packages_test"

cd $path
wget "$downloadUrl"
tar -xvf $filename

intellij_dir="/opt/intellij-idea"

sudo mv idea-IU-* $intellij_dir
sudo ln -s $intellij_dir/bin/idea.sh /usr/local/bin/idea

echo "[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA
Icon=$intellij_dir/bin/idea.png
Exec=$intellij_dir/bin/idea.sh
Comment=Powerful IDE for Java development
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea" | sudo tee /usr/share/applications/intellij-idea.desktop > /dev/null

sudo update-desktop-database