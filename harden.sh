#!/bin/bash
# harden.sh

echo "=== HARDENING STARTED ==="

# Secure local Vault
echo "[*] Checking ~/Vault..."
mkdir -p "$HOME/Vault"

echo "[*] Locking down ~/Vault..."
chmod 700 "$HOME/Vault"
chown "$USER":"$USER" "$HOME/Vault"

# Secure /etc/shadow
echo "[*] Fixing /etc/shadow permissions..."
sudo chmod 640 /etc/shadow
sudo chown root:shadow /etc/shadow

echo "=== HARDENING COMPLETE ==="
