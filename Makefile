.DEFAULT_GOAL := stow

.PHONY: stow
stow:
	@stow -t ~ bash
	@echo "✅ bash files stowed"

	@stow -t ~/.config nvim
	@echo "✅ neovim files stowed"
