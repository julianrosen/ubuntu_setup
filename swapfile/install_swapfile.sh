#!/usr/bin/env bash

sudo swapoff /swapfile
sudo fallocate -l 64G /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
