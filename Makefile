.DEFAULT_GOAL := stow

bash:
	@if [ -f ~/.bash_aliases ]; then rm -rf ~/.bash_aliases; fi
	@if [ -f ~/.bash_logout ]; then rm -rf ~/.bash_logout; fi
	@if [ -f ~/.bash_profile ]; then rm -rf ~/.bash_profile; fi
	@if [ -f ~/.bashrc ]; then rm -rf ~/.bashrc; fi
	@stow -t ~ bash
	@echo "✅ bash files stowed"

hypr:
	@mkdir -p ~/.config/hypr
	@if [ -d ~/.config/hypr ]; then rm -rf ~/.config/hypr/**; fi
	@stow -t ~/.config/hypr hypr
	@echo "✅ hyprland files stowed"

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

qutebrowser:
	@mkdir -p ~/.config/qutebrowser
	@if [ -d ~/.config/qutebrowser ]; then rm -rf ~/.config/qutebrowser/config.py; fi
	@stow -t ~/.config/qutebrowser qutebrowser
	@echo "✅ qutebrowser files stowed"

tmux:
	@mkdir -p ~/.config/tmux
	@if [ -d ~/.config/tmux ]; then rm -rf ~/.config/tmux/**; fi
	@stow -t ~/.config/tmux tmux
	@echo "✅ tmux files stowed"

waybar:
	@mkdir -p ~/.config/waybar
	@if [ -d ~/.config/waybar ]; then rm -rf ~/.config/waybar/**; fi
	@stow -t ~/.config/waybar waybar
	@echo "✅ waybar files stowed"

wofi:
	@mkdir -p ~/.config/wofi
	@if [ -d ~/.config/wofi ]; then rm -rf ~/.config/wofi/**; fi
	@stow -t ~/.config/wofi wofi
	@echo "✅ wofi files stowed"

stow:
	bash
	hypr
	kitty
	neofetch
	nvim
	tmux
	waybar
	wofi
	qutebrowser


.PHONY: stow bash hyper kitty neofetch nvim qutebrowser tmux waybar wofi
