#!/bin/bash

mv .emacs ~

cd ~
rm -rf *
mkdir tsuigeo
cd tsuigeo
mkdir bin
mkdir src
mkdir data
mkdir etc


#install emacs
cd ~
sudo apt-get install emacs
echo "alias emacs='emacs -nw'" >> .bashrc
