#!/bin/bash

option=""
choose=""
no_menu_principal=true  # Variável para controlar se estamos no menu principal

categories() {
    echo "Available items:"
    echo "1. dev tools"
    echo "2. games"
    echo "3. office"
    echo "4. Sair"

    read -p "Choose the item: " option

    case $option in
        1)
            options=("vscode" "intelliji" "docker" "kubctl" "go back")    
            showItems "${options[@]}" 
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
            clear
            echo "Option not valid. Try again"
            no_menu_principal=true
            ;;
    esac
}

showItems() {
    clear

    echo "DEV TOOLS:"
    echo -e "Choose the number of the item you want to install, ex: 1,2,3\n"

    items=("$@")
    num_items=$(( ${#options[@]} - 1 ))

    for ((i=0; i<${#items[@]}; i++)); do
        echo -e "$(( $i + 1 )). ${items[$i]}"
    done

    read -p "Choose the item: " option

    # case $option in
    #     0)
    #         no_menu_principal=true  # Estamos voltando para o menu principal
    #         clear
    #         ;;
    # esac

    
}

devTools() {
    clear

    echo "DEV TOOLS:"
    echo -e "Choose the number of the item you want to install, ex: 1,2,3\n"
    echo "1. vscode"
    echo "2. intelliji"
    echo "3. docker"
    echo "4. kubctl"
    echo "0. go back"

    read -p "Choose the item: " option

    case $option in
        1)
            echo "You chose 1."
            devTools
            ;;
        2)
            echo "You chose 2."
            ;;
        3)
            echo "You chose 3."
            ;;
        0)
            no_menu_principal=true  # Estamos voltando para o menu principal
            clear
            ;;
        *)
            echo "Option not valid. Try again"
            ;;
    esac
}

showMenu() {
    while $no_menu_principal; do
        categories

        choose="$option"
    done
}