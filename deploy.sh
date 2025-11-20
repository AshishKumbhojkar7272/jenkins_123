#!/bin/bash
# deploy.sh — deploys repository files to Apache webroot
set -euo pipefail
echo "[deploy.sh] Starting deploy..."

# If apache not installed, install it (requires sudo)
if ! command -v apache2ctl >/dev/null 2>&1; then
  echo "[deploy.sh] Apache not found - installing..."
  sudo apt-get update
  sudo apt-get install -y apache2
  sudo systemctl enable --now apache2
fi

# Copy files to web root
sudo rm -rf /var/www/html/*
sudo cp -r ./* /var/www/html/
# Ensure webserver user owns the files
sudo chown -R www-data:www-data /var/www/html

echo "[deploy.sh] Deployment finished. Site available on port 80."
