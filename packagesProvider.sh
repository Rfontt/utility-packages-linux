#!/bin/bash

manager=""
command=""

. ./log.sh

packageManager() {
    projectNameLog

    if [ -x "$(command -v apt-get)" ]; then
        manager="apt"
        command="apt-get install"
    elif [ -x "$(command -v yum)" ]; then
        manager="yum"
        command="yum install"
    elif [ -x "$(command -v dnf)" ]; then
        manager="dnf"
        command="dnf install"
    elif [ -x "$(command -v zypper)" ]; then
        manager="zypper"
        command="zypper install"
    elif [ -x "$(command -v pacman)" ]; then
        manager="pacman"
        command="pacman -S"
    elif [ -x "$(command -v apk)"]; then
        manager="apk"
        command="apk add"
    else
        manager="Unkown"
        command=""
    fi
    
    echo "Your package manager is $manager"
}

verifyPackage() {
    package="$1"
    package_found=0

    case "$manager" in
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
            if yum list installed | grep -q "$package" || dnf list installed | grep -q "$package"; then
                package_found=1
            fi
            ;;
        pacman)
            if pacman -Q "$package" > /dev/null 2>&1; then
                package_found=1
            fi
            ;;
        *)
            echo "We dont have support to this package manager"
            ;;
    esac

    echo "$package_found"
}

installPackages() {
    packages=("grep" "tar" "curl" "figlet")

    for package in "${packages[@]}"; do
        package_found=$(verifyPackage "$package")

        if [ $package_found -ne 1 ]; then
            echo "$package will be installed."
            sudo $command "$package"
        fi
    done
}