#!/bin/bash

echo "How package manager do you want use? Ex: apt, pacman"
read package_manager

if [ "$package_manager" = "pacman" ]; then
    sudo pacman -Syu
else
    echo "We dont have support to this package manager"
fi
