#!/bin/bash

# Define the path to the zshrc file
ZSHRC_FILE="$HOME/.zshrc"

# Check if the function is already defined in .zshrc
if grep -q "MOUB()" "$ZSHRC_FILE"; then
    echo "MOUB function already exists."
else
    echo "Adding MOUB function..."
    cat <<'EOF' >> "$ZSHRC_FILE"
MOUB() {
    while true; do
        if ioreg -c IOHIDEventSystem | grep -i "Event" > /dev/null; then
            echo "Locking the screen..."
            open -a ScreenSaverEngine
            sleep 1
            exit 0
        fi
        sleep 1
    done
}
EOF
fi

# Check if the alias is already defined in .zshrc
if grep -q "alias moub=" "$ZSHRC_FILE"; then
    echo "moub alias already exists."
else
    echo "Adding moub alias..."
    echo "alias moub=\"MOUB\"" >> "$ZSHRC_FILE"
fi

# Reload .zshrc
echo "Reloading .zshrc..."
source "$ZSHRC_FILE"
echo "MOUB function and alias 'moub' are set up!"
