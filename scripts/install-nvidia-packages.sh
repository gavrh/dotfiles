#!/bin/bash
set -e

echo "[*] updating system..."
sudo pacman -Syu --noconfirm

if [ -f packages-nvidia.txt ]; then
    echo "[*] installing nvidia repo packages..."
    # split repo/aur by availability
    repo_nvidia=$(comm -12 <(pacman -Slq | sort) <(sort packages-nvidia.txt))
    aur_nvidia=$(comm -13 <(pacman -Slq | sort) <(sort packages-nvidia.txt))

    if [ -n "$repo_nvidia" ]; then
        echo "$repo_nvidia" | sudo pacman -S --needed --noconfirm -
    fi

    if [ -n "$aur_nvidia" ]; then
        echo "$aur_nvidia" | yay -S --needed --noconfirm -
    fi
else
    echo "[!] packages-nvidia.txt not found."
    exit 1
fi

echo "[*] nvidia packages installed!"

