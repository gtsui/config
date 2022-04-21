#!/bin/bash

DIR=`pwd`

# Link config file
ln init.el ~/.emacs.d/init.el

# Install emacs
sudo snap install emacs --classic
cd ~
echo "alias emacs='emacs -mm'" >> .bashrc

