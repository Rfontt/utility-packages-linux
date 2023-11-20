#!/bin/bash

option=""
choosenItems=""

showMenu() {
    items=("Intellij" "VS Code" "Java" "Exit")

    echo -e "Available items: \n"

    for ((i = 0; i < ${#items[@]}; i++)); do
        echo "$((i + 1)). ${items[i]}"
    done

    read -p "Choose the item. Ex: 1,2,3 " option

    case $option in
        4)
            echo "Exit."
            exit 0
            ;;
        *)
            echo "Option not valid. Try again"
            ;;
    esac

    choosenItems=$option
}