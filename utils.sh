#!/bin/bash

cli_hosen=""
command=""
has_support="false"

packageManager() {
    echo "How package manager do you want use? Ex: apt, pacman"
    read package_manager

    cli_hosen=$package_manager

    if [ "$cli_hosen" = "pacman" ]; then
        has_support="true"

        command="pacman -S"
    else
        has_support="false"

        echo "We dont have support to this package manager"
    fi
}

installPackates() {
    packages=("grep")

    if [ "$has_support" = "true" ]; then
        for package in "${packages[@]}"; do
            if package -Q "$package" > /dev/null 2>&1; then
                echo "$package already exists."
            else
                sudo $1 "$package"
            fi
        done
    fi
}

# sudo pacman -S "$package"