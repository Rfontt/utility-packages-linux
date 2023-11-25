#!/bin/bash

. ./toolsList.sh
. ./extractDownloadFolder.sh
. ./appProvider.sh
. ./log.sh

temp_dir=$(mktemp -d -p "$HOME" packages.XXXXXX)

installIntellij() {
    echo "Should do download of the Intelliji IDE"

    appChooseNumber="1"

    for tool in "${!tools[@]}"; do
        toolNumber="${tools[$tool]%,*}"

        if [ "$toolNumber" == "$appChooseNumber" ]; then
            installApp "$tool" "$temp_dir"
        fi
    done

    rm -rf "/usr/share/applications/Intellij-IDEA.desktop"
    rm -rf "/opt/intellij"
    rm -rf "/usr/local/bin/idea"

    echo "Everything is ok..."
}

tests() {
    text="  _____         _       \n|_   _|__  ___| |_ ___ \n  | |/ _ \\/ __| __/ __|\n  | |  __/\\__ \\ |\\__ \ \n  |_|\\___||___/\\__|___/"

    projectNameLog "$text"

    installIntellij

    rm -rf "$temp_dir"
}

tests