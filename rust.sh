#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install -y git clang curl libssl-dev llvm libudev-dev

# Install rust
curl https://sh.rustup.rs -sSf | sh
source ~/.cargo/env
