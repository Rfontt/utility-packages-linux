#!/bin/bash

declare -A tools
declare -A toolsDir
declare -A toolsIcon
declare -A toolsExec
declare -A toolsFolderTarget
declare -A toolsAppName
declare -A toolsComment
declare -A toolsCategory
declare -A toolsStartupWMClass

tools=(
    [intellij]="1,$(curl -sL "https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&type=release" | grep -oP '"linux":{"link":"\K[^"]+')"
    [vscode]="2,https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
)

mainFolder="/opt"

toolsDir=(
    [intellij]="1,$mainFolder/intellij"
    [vscode]="2,$mainFolder/vscode"
)

toolsIcon=(
    [intellij]="1,bin/idea.png"
    [vscode]="2,test"
)

toolsExec=(
    [intellij]="1,bin/idea.sh"
    [vscode]="2,test"
)

toolsFolderTarget=(
    [intellij]="1,/usr/local/bin/idea"
    [vscode]="2,test"
)

toolsAppName=(
    [intellij]="1,Intellij-IDEA"
    [vscode]="2,test"
)

toolsComment=(
    [intellij]="1,Powerful IDE for Java development"
    [vscode]="2,Code Editing. Redefined."
)

toolsCategory=(
    [intellij]="1,Development;IDE;"
    [vscode]="2,Utility;TextEditor;Development;IDE;"
)

toolsStartupWMClass=(
    [intellij]="1,jetbrains-idea"
    [vscode]="2,vscode"
)