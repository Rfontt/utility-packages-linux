#!/bin/bash

option=""
choose=""

showMenu() {
    echo "Available items:"
    echo "1. Intelijji"
    echo "2. VS Code"
    echo "3. Java"
    echo "4. Sair"

    read -p "Choose the item: " option

    case $option in
        1)
            echo "You chose 1."
            ;;
        2)
            echo "You chose 2."
            ;;
        3)
            echo "You chose 3."
            ;;
        4)
            echo "Exit."
            exit 0
            ;;
        *)
            echo "Option not valid. Try again"
            ;;
    esac
}