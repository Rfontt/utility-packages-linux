#!/bin/bash

extractDownloadFolder() {
    downloadUrl="$1"
    temp_dir="$2"
    filename=$(basename "$downloadUrl")

    cd "$temp_dir"

    curl -o "$filename" -L "$downloadUrl"
    tar -xvf "$filename"
}