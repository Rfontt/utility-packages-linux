#!/bin/bash

extractDownloadFolder() {
    downloadUrl="$1"
    temp_dir="$2"
    folderName="$3"
    tarBaseName=$(basename "$downloadUrl")

    cd "$temp_dir"
    mkdir "$folderName"

    curl -o "$tarBaseName" -L "$downloadUrl"
    tar -xf "$tarBaseName" --strip-components=1 -C "$folderName"
}