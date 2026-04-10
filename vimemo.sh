#!/bin/bash
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

MEMO_DIR="$HOME/.vimemo"
mkdir -p "$MEMO_DIR"

TODAY=$(date +%Y-%m-%d)
MEMO_FILE="$MEMO_DIR/$TODAY.md"

# .app 内: Contents/MacOS/vimemo → ../Resources/
# 直接実行: 同じディレクトリ
SELF_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$SELF_DIR/../Resources/wezterm-vimemo.lua" ]; then
    WEZTERM_CONFIG="$SELF_DIR/../Resources/wezterm-vimemo.lua"
    NVIM_EXTRA="$SELF_DIR/../Resources/vimemo-nvim.lua"
else
    WEZTERM_CONFIG="$SELF_DIR/wezterm-vimemo.lua"
    NVIM_EXTRA="$SELF_DIR/vimemo-nvim.lua"
fi

WEZTERM="$(command -v wezterm)"
NVIM="$(command -v nvim)"

if [ -f "$MEMO_FILE" ]; then
    "$WEZTERM" --config-file "$WEZTERM_CONFIG" \
        start --always-new-process --cwd "$MEMO_DIR" \
        -- "$NVIM" -c "luafile $NVIM_EXTRA" -c "normal! G" "$MEMO_FILE"
else
    "$WEZTERM" --config-file "$WEZTERM_CONFIG" \
        start --always-new-process --cwd "$MEMO_DIR" \
        -- "$NVIM" -c "luafile $NVIM_EXTRA" -c "normal! i# $TODAY
" -c "normal! G" "$MEMO_FILE"
fi
