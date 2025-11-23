# Rootless Scratch

A minimal, secure Docker base image built from scratch with essential components for running applications as a non-root user.

## Features

- **Minimal footprint**: Based on Docker's scratch image for maximum security and minimal attack surface
- **Rootless**: Runs as non-root user `app` (UID 1000) by default
- **Timezone support**: Pre-configured for Europe/Riga timezone
- **SSL/TLS ready**: Includes CA certificates for secure connections
- **Locale support**: Configured for Latvian (lv_LV.UTF-8) locale
- **Secure tmp directory**: Private /tmp directory with proper permissions

## Building

Build the image locally:

```bash
docker build -t rootless-scratch:edge .
```
