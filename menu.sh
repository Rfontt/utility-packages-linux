#!/bin/bash

showMenu() {
    clear
    echo "Available itens:"
    echo "1. dev tools"
    echo "2. games"
    echo "3. office"
    echo "4. Sair"
}

devTools() {
    clear
    echo "DEV TOOLS:"
    echo "1. vscode"
    echo "2. intelliji"
    echo "3. docker"
    echo "4. kubctl"

    exit 0
}

# Loop principal
while true; do
    showMenu

    # Ler a escolha do usuário
    read -p "Choose the item: " opcao

    case $opcao in
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
        4)
            echo "Saindo do programa."
            exit 0
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac

    read -p "Enter to continue..."
done
