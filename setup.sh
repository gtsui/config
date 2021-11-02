#!/bin/bash

cd ~
mkdir tsuigeo
cd tsuigeo
mkdir bin
mkdir lib
mkdir src
mkdir data
mkdir etc
mkdir tmp && mkdir tmp/downloads

# Set path
echo 'export PATH="$PATH:/home/tsuigeo/tsuigeo/bin"' >> .bashrc
