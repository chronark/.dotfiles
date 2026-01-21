.PHONY: install brew stow unstow update doctor

# Full setup for new machine
install: brew stow

# Install Homebrew packages
brew:
	brew bundle --file=Brewfile

# Create symlinks from home/ to ~/
stow:
	stow -v -d . -t ~ home

# Remove symlinks
unstow:
	stow -v -D -d . -t ~ home

# Update everything
update:
	git pull
	brew bundle --file=Brewfile
	brew upgrade
	$(MAKE) stow

# Health check
doctor:
	@echo "=== Checking symlinks ==="
	@for f in $$(find home -type f | sed 's|^home/||'); do \
		if [ -L ~/$$f ]; then \
			echo "✓ $$f"; \
		else \
			echo "✗ $$f (not linked)"; \
		fi; \
	done
	@echo ""
	@echo "=== Checking packages ==="
	@brew bundle check --file=Brewfile || true
