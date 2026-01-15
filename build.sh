#!/bin/bash
set -e

echo "🔨 Building DevilutionX..."
cmake --build build -j $(getconf _NPROCESSORS_ONLN) > /dev/null 2>&1

echo "📦 Packaging..."
rm -rf extracted devilutionx-complete.zip
mkdir -p extracted
unzip -q build/devilutionx.zip -d extracted
cp -r mods extracted/devilutionx/
cd extracted
zip -q -r ../devilutionx-complete.zip devilutionx/

echo "✅ Done! Package: $(ls -lh ../devilutionx-complete.zip | awk '{print $5, $9}')"
