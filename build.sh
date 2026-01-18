#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "🔨 Building DevilutionX..."
cmake --build build -j $(getconf _NPROCESSORS_ONLN) --target devilutionx --target hellfire_mpq > /dev/null 2>&1

echo "📦 Packaging..."
cmake --build build --target package > /dev/null 2>&1
rm -rf build/extracted build/devilutionx-complete.zip
mkdir -p build/extracted
unzip -q build/devilutionx.zip -d build/extracted
mkdir -p build/extracted/devilutionx/mods
cp build/mods/Hellfire.mpq build/extracted/devilutionx/mods/
cd build/extracted
zip -q -r ../devilutionx-complete.zip devilutionx/
cd ../..

echo "✅ Done! Package: $(ls -lh build/devilutionx-complete.zip | awk '{print $5, $9}')"
