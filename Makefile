# Default target to setup MOUB
.PHONY: setup remove

setup:
	@echo "Setting up MOUB function and alias..."
	@./setup_moub.sh

# Remove the MOUB function and alias from .zshrc
remove:
	@echo "Removing MOUB function and alias..."
	@sed -i '' '/MOUB()/,/^}/d' ~/.zshrc  # Remove function
	@sed -i '' '/alias moub/d' ~/.zshrc    # Remove alias
	@echo "MOUB function and alias 'moub' have been removed."
