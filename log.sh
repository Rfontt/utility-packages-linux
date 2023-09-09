#!/bin/bash

projectNameLog() {
    string="  ____ _____ _                  \n|  _ \\_   _(_)_ __  _   ___  __\n| |_) || | | | '_ \| | | \\ \\/ /\n|  _ < | | | | | | | |_| |>  < \n|_| \\_\\|_| |_|_| |_|\\__,_/_/\\_\\"
    length=${#string}
    padding=$(( (80 - length) / 2 ))
    green=$(tput setaf 2)
    reset=$(tput sgr0)
    
    for ((i = 0; i < padding; i++)); do
        printf " "
    done

    echo -e "${green}$string${reset}"
}
