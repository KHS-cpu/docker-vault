#!/bin/sh

CERT_DIR="/etc/nginx/certs"
CRT="$CERT_DIR/nginx.crt"
KEY="$CERT_DIR/nginx.key"

mkdir -p "$CERT_DIR"

if [ ! -f "$CRT" ] || [ ! -f "$KEY" ]; then
  echo "Generating self-signed certificate..."
  openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout "$KEY" \
    -out "$CRT" \
    -subj "/CN=localhost"
else
  echo "Using existing certificate..."
fi

# Start nginx
nginx -g 'daemon off;'
