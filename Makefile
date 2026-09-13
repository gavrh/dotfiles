.DEFAULT_GOAL := stow
MAKEFLAGS += --no-print-directory

HOME_PACKAGES := bash xorg
PACKAGES := $(patsubst %/,%,$(filter-out .git/,$(wildcard */)))

stow: $(PACKAGES)

$(PACKAGES):
	@if [ -n "$(filter $@,$(HOME_PACKAGES))" ]; then \
		target="$$HOME"; \
		for path in "$@"/* "$@"/.[!.]* "$@"/..?*; do \
			[ -e "$$path" ] || [ -L "$$path" ] || continue; \
			rm -rf "$$target/$${path##*/}"; \
		done; \
	else \
		target="$$HOME/.config/$@"; \
		rm -rf "$$target"; \
		mkdir -p "$$target"; \
	fi; \
	stow -t "$$target" "$@"; \
	echo "✅ $@ files stowed"

.PHONY: stow $(PACKAGES)
