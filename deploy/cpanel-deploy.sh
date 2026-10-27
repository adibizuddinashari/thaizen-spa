#!/bin/bash
# Copies the public site files from this repo into public_html.
# Run by .cpanel.yml ("Deploy HEAD Commit") and by the auto-deploy cron.
set -e
cd "$(dirname "$0")/.."
DEST="$HOME/public_html"
mkdir -p "$DEST/assets"
cp index.html menu.html maintenance.html "$DEST/"
cp -R assets/. "$DEST/assets/"
echo "$(date '+%F %T') deployed $(git rev-parse --short HEAD)" >> "$HOME/thaizen-deploy.log"
