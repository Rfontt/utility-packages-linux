#!/bin/bash

. ./toolsList.sh
. ./extractDownloadFolder.sh

transformToApp() {
    dir="$1"
    icon="$2"
    exec="$3"
    folderName="$4"
    folderTarget="$5"
    appName="$6"
    comment="$7"
    categories="$8"
    startupWMClass="$9"

    sudo mv $folderName $dir
    sudo ln -s $exec $folderTarget

    echo "[Desktop Entry]
    Version=1.0
    Type=Application
    Name=$appName
    Icon=$icon
    Exec=$exec
    Comment=$comment
    Categories=$categories
    Terminal=false
    StartupWMClass=$startupWMClass" | sudo tee /usr/share/applications/$appName.desktop > /dev/null

    sudo update-desktop-database
}

installApp() {
    tool="$1"
    temp_dir="$2"

    url=${tools[$tool]#*,}
    dir=${toolsDir[$tool]#*,}
    icon=${toolsIcon[$tool]#*,}
    exec=${toolsExec[$tool]#*,}
    folderTarget=${toolsFolderTarget[$tool]#*,}
    appName=${toolsAppName[$tool]#*,}
    comment=${toolsComment[$tool]#*,}
    category=${toolsCategory[$tool]#*,}
    startupWMClass=${toolsStartupWMClass[$tool]#*,}

    extractDownloadFolder "$url" "$temp_dir" "$tool"
    transformToApp "$dir" "$dir/$icon" "$dir/$exec" "$tool" "$folderTarget" "$appName" "$comment" "$category" "$startupWMClass"

    echo "$appName is installed..."
}