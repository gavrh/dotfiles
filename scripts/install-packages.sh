#!/bin/bash
set -e

echo "[*] updating system..."
sudo pacman -Syu --noconfirm

echo "[*] installing base-devel and git..."
sudo pacman -S --needed --noconfirm base-devel git

if ! command -v yay &> /dev/null; then
    echo "[*] installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
fi

if [ -f packages-pacman.txt ]; then
    echo "[*] installing repo packages..."
    sudo pacman -S --needed --noconfirm - < packages-pacman.txt
fi

if [ -f packages-aur.txt ]; then
    echo "[*] installing aur packages..."
    yay -S --needed --noconfirm - < packages-aur.txt
fi

echo "[*] package setup complete!"

