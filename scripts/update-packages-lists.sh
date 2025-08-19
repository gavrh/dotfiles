# repo packages (excluding nvidia ones)
pacman -Qqe | grep -vx "$(pacman -Qqm)" | grep -v "nvidia" > packages-pacman.txt

# aur packages (excluding nvidia ones)
pacman -Qqm | grep -v "nvidia" > packages-aur.txt

# all nvidia-related packages (repo + aur) into separate file
pacman -Qqe | grep "nvidia" > packages-nvidia.txt
pacman -Qqm | grep "nvidia" >> packages-nvidia.txt

