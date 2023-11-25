#!/bin/bash

temp_dir=$(mktemp -d -p "$HOME" packages.XXXXXX)

. ./packagesProvider.sh
. ./appProvider.sh
. ./extractDownloadFolder.sh
. ./menu.sh
. ./toolsList.sh

packageManager
installPackages
showMenu

for item in "${choosenItems[@]}"; do
    for tool in "${!tools[@]}"; do
        toolNumber="${tools[$tool]%,*}"

        if [ "$toolNumber" == "$item" ]; then
            installApp "$tool" "$temp_dir"
        fi
    done
done

rm -rf "$temp_dir"