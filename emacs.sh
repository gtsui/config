#!/bin/bash

DIR=`pwd`

# Link config file
ln .emacs ~/.emacs

# Install emacs
sudo apt-get install emacs
cd ~
echo "alias emacs='emacs -mm'" >> .bashrc

