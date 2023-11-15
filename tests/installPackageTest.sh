#!/bin/bash

echo "Should do download of the Intelliji IDE"

. ./toolsList.sh

temp_dir=$(mktemp -d -p "$HOME/Documentos/projects" packages.XXXXXX)

for key in "${!tools[@]}"; do
    url=${tools[$key]#*,}
    echo "Name: $name, URL: $url"

    extractDownloadFolder "$url" "$temp_dir"
done