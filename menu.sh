#!/bin/bash

option=""
choosenItems=()

showMenu() {
    items=("Intellij" "VS Code" "Exit")

    echo -e "Available items: \n"

    for ((i = 0; i < ${#items[@]}; i++)); do
        echo "$((i + 1)). ${items[i]}"
    done
    
    while true; do
        read -p "Choose an item by its number or enter 'q' to quit: " option

        if [[ $option == 'q' ]]; then
            break
        elif [[ $option =~ ^[0-9]+$ && $option -ge 1 && $option -le ${#items[@]} ]]; then
            choosenItems+=("${option}")

            echo "Selected item: ${items[option - 1]}"
        else
            echo "Invalid option. Please choose a valid number or 'q' to quit."
        fi

        read -p "Do you want to choose another item? (y/n): " continue_choice
        if [[ $continue_choice != 'y' ]]; then
            break
        fi
    done
}