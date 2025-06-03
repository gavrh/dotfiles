.DEFAULT_GOAL := stow
MAKEFLAGS += --no-print-directory

bash:
	@if [ -f ~/.bash_aliases ]; then rm -rf ~/.bash_aliases; fi
	@if [ -f ~/.bash_logout ]; then rm -rf ~/.bash_logout; fi
	@if [ -f ~/.bash_profile ]; then rm -rf ~/.bash_profile; fi
	@if [ -f ~/.bashrc ]; then rm -rf ~/.bashrc; fi
	@stow -t ~ bash
	@echo "✅ bash files stowed"

i3:
	@mkdir -p ~/.config/i3
	@if [ -d ~/.config/i3 ]; then rm -rf ~/.config/i3/**; fi
	@stow -t ~/.config/i3 i3
	@echo "✅ i3 files stowed"

kitty:
	@mkdir -p ~/.config/kitty
	@if [ -d ~/.config/kitty ]; then rm -rf ~/.config/kitty/**; fi
	@stow -t ~/.config/kitty kitty
	@echo "✅ kitty files stowed"

neofetch:
	@mkdir -p ~/.config/neofetch
	@if [ -d ~/.config/neofetch ]; then rm -rf ~/.config/neofetch/**; fi
	@stow -t ~/.config/neofetch neofetch
	@echo "✅ neofetch files stowed"

nvim:
	@mkdir -p ~/.config/nvim
	@if [ -d ~/.config/nvim ]; then rm -rf ~/.config/nvim/**; fi
	@stow -t ~/.config/nvim nvim
	@echo "✅ neovim files stowed"

polybar:
	@mkdir -p ~/.config/polybar
	@if [ -d ~/.config/polybar ]; then rm -rf ~/.config/polybar/**; fi
	@stow -t ~/.config/polybar polybar
	@echo "✅ polybar files stowed"

qutebrowser:
	@mkdir -p ~/.config/qutebrowser
	@if [ -d ~/.config/qutebrowser ]; then rm -rf ~/.config/qutebrowser/config.py; fi
	@stow -t ~/.config/qutebrowser qutebrowser
	@echo "✅ qutebrowser files stowed"

rofi:
	@mkdir -p ~/.config/rofi
	@if [ -d ~/.config/rofi ]; then rm -rf ~/.config/rofi/**; fi
	@stow -t ~/.config/rofi rofi
	@echo "✅ rofi files stowed"

tmux:
	@mkdir -p ~/.config/tmux
	@if [ -d ~/.config/tmux ]; then rm -rf ~/.config/tmux/**; fi
	@stow -t ~/.config/tmux tmux
	@echo "✅ tmux files stowed"

xorg:
	@if [ -f ~/.xinitrc ]; then rm -rf ~/.xinitrc ; fi
	@if [ -f ~/.xprofile ]; then rm -rf ~/.xprofile; fi
	@if [ -f ~/.xresources ]; then rm -rf ~/.xresources; fi
	@stow -t ~ xorg
	@echo "✅ xorg files stowed"

stow: bash i3 kitty neofetch nvim polybar qutebrowser rofi tmux xorg

.PHONY: stow bash i3 kitty neofetch nvim polybar qutebrowser rofi tmux xorg
