#!/bin/bash

DIR=`pwd`

# Link config file
ln .emacs ~/.emacs

# Install emacs
cd ~
sudo apt-get install emacs
