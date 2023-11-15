#!/bin/bash

. ./extractDownloadFolder.sh

declare -A tools

tools=(
    [intelliji]="1,$(curl -sL "https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&type=release" | grep -oP '"linux":{"link":"\K[^"]+')"
    [vscode]="2,https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
)

mainFolder="/opt"

toolsDir=(
    "$mainFolder/intellij-idea"
    "$mainFolder/vscode"
)