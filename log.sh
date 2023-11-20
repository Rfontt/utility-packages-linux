#!/bin/bash

projectNameLog() {
    text="$1"
    length=${#text}
    padding=$(( (80 - length) / 2 ))
    green=$(tput setaf 2)
    reset=$(tput sgr0)
    
    for ((i = 0; i < padding; i++)); do
        printf " "
    done

    echo -e "${green}$text${reset}"
}
