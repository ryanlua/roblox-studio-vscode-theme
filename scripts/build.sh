#!/bin/bash
set -e

echo "Building Rojo projects..."

OUTPUT_NAME="ThemeTests"
ROJO_PROJECT="default.project.json"

# Cleanup previous build artifacts in root
echo "Cleaning up previous build artifacts..."
rm -f "$OUTPUT_NAME.rbxm" "$OUTPUT_NAME.rbxmx"

# Build .rbxm file
rojo build --output "$OUTPUT_NAME.rbxm" $ROJO_PROJECT

# Build .rbxmx file
rojo build --output "$OUTPUT_NAME.rbxmx" $ROJO_PROJECT

echo "Build completed successfully!"