#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
APP="$SCRIPT_DIR/Vimemo.app"

rm -rf "$APP"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"

cp "$SCRIPT_DIR/wezterm-vimemo.lua" "$APP/Contents/Resources/"
cp "$SCRIPT_DIR/vimemo-nvim.lua" "$APP/Contents/Resources/"
cp "$SCRIPT_DIR/vimemo.sh" "$APP/Contents/MacOS/vimemo"
chmod +x "$APP/Contents/MacOS/vimemo"

cat > "$APP/Contents/Info.plist" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>vimemo</string>
    <key>CFBundleIdentifier</key>
    <string>com.vimemo.app</string>
    <key>CFBundleName</key>
    <string>Vimemo</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>LSUIElement</key>
    <true/>
</dict>
</plist>
EOF

echo "Built: $APP"

if [ "$1" = "--install" ]; then
    rm -rf /Applications/Vimemo.app
    cp -R "$APP" /Applications/Vimemo.app
    echo "Installed: /Applications/Vimemo.app"
fi
