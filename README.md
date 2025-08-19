# dotfiles
My dotfiles for my arch linux, i3 with xorg desktop setup.

## Installation
```bash
# clone repo
git clone https://github.com/gavrh/dotfiles.git

cd dotfiles

# install packages
./scripts/install-packages.sh

# if nvidia
./scripts/install-nvidia-packages.sh

# stow all config files
make

# stow specific config
make <config>
```
