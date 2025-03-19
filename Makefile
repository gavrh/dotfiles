.DEFAULT_GOAL := stow

.PHONY: stow
stow:
	@stow -t ~ bash
	@echo "✅ bash files stowed"

	@mkdir -p ~/.config/hypr
	@if [ -d ~/.config/hypr ]; then rm -rf ~/.config/hypr/**; fi
	@stow -t ~/.config/hypr hypr
	@echo "✅ hyprland files stowed"

	@mkdir -p ~/.config/kitty
	@if [ -d ~/.config/kitty ]; then rm -rf ~/.config/kitty/**; fi
	@stow -t ~/.config/kitty kitty
	@echo "✅ kitty files stowed"

	@mkdir -p ~/.config/neofetch
	@if [ -d ~/.config/neofetch ]; then rm -rf ~/.config/neofetch/**; fi
	@stow -t ~/.config/neofetch neofetch
	@echo "✅ neofetch files stowed"

	@mkdir -p ~/.config/nvim
	@if [ -d ~/.config/nvim ]; then rm -rf ~/.config/nvim/**; fi
	@stow -t ~/.config/nvim nvim
	@echo "✅ neovim files stowed"

	@mkdir -p ~/.config/waybar
	@if [ -d ~/.config/waybar ]; then rm -rf ~/.config/waybar/**; fi
	@stow -t ~/.config/waybar waybar
	@echo "✅ waybar files stowed"
