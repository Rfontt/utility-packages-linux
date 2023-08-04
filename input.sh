#!/bin/bash

echo "How is your linux destribuition?"
read destribuition

if [ "$destribuition" = "arch" ]; then
    echo "Alright"
else
    echo "We dont have support to this distribuition"
fi
