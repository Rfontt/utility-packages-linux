#!/bin/bash

cli_hosen=""
command=""

. ./log.sh

packageManager() {
    projectNameLog
    
    echo "How package manager do you want use? Ex: apt, pacman"
    read package_manager

    cli_hosen=$package_manager

    if [ "$cli_hosen" = "pacman" ]; then
        command="pacman -S"
    else
        echo "We dont have support to this package manager"
        exit 1
    fi
}

verifyPackage() {
    package="$1"
    package_found=0

    case "$cli_hosen" in
        dpkg)
            if dpkg -l | grep -q "ii  $package "; then
                package_found=1
            fi
            ;;
        rpm)
            if rpm -q "$package" > /dev/null 2>&1; then
                package_found=1
            fi
            ;;
        apk)
            if apk info "$package" > /dev/null 2>&1; then
                package_found=1
            fi
            ;;
        dnf|yum)
            if "$package_manager" list installed | grep -q "$package"; then
                package_found=1
            fi
            ;;
        pacman)
            if pacman -Q "$package" > /dev/null 2>&1; then
                package_found=1
            fi
            ;;
        *)
            echo "Gerenciador de pacotes não suportado: $package_manager"
            ;;
    esac

    echo "$package_found"
}

installPackages() {
    packages=("grep" "tar" "curl" "figlet")

    for package in "${packages[@]}"; do
        package_found=$(verifyPackage "$package")
        
        if [ $package_found -eq 1 ]; then
            echo "$package is already installed."
        else
            echo "$package will be installed."
            sudo $command "$package"
        fi
    done
}