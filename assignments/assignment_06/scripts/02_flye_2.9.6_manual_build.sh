#!/bin/bash

set -ueo

cd ~/programs

if [ ! -d Flye ]; then
    git clone https://github.com/fenderglass/Flye.git
else
    echo "Flye folder already exists, skipping clone"
fi

cd Flye

make


