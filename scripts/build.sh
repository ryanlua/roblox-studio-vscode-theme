#!/bin/bash
set -e

echo "Building Rojo projects..."

OUTPUT_NAME="ThemeTests"
ROJO_PROJECT="default.project.json"

# Cleanup previous build artifacts in root
echo "Cleaning up previous build artifacts..."
rm -f "$OUTPUT_NAME.rbxm" "$OUTPUT_NAME.rbxmx"

# Build .rbxm file
rojo build $ROJO_PROJECT --output "$OUTPUT_NAME.rbxm"

# Build .rbxmx file
rojo build $ROJO_PROJECT --output "$OUTPUT_NAME.rbxmx"

echo "Build completed successfully!"