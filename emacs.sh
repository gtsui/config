#!/bin/bash

DIR=`pwd`

#link config file
ln .emacs ~/.emacs

#Install emacs
cd ~
sudo apt-get install emacs
echo "alias emacs='emacs -nw'" >> .bashrc
echo 'export PATH="$PATH:/home/tsuigeo/tsuigeo/bin"' >> .bashrc

#Setup emacs library
mkdir ~/tsuigeo/lib/emacs
