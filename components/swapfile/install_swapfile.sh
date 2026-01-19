#!/usr/bin/env bash

SWAP_SIZE_GB="${1:-64}"

sudo swapoff /swapfile
sudo fallocate -l "${SWAP_SIZE_GB}G" /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
