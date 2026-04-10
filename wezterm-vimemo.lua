local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Kanagawa Dragon (Gogh)'
config.font = wezterm.font_with_fallback {
    { family = 'JetBrainsMono Nerd Font', weight = 'Light' },
    'Hiragino Maru Gothic ProN'
}
config.font_size = 14.0
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.use_ime = true
config.term = "xterm-256color"

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.initial_cols = 120
config.initial_rows = 40
config.window_background_opacity = 0.95
config.window_padding = {
    left = 8, right = 8, top = 8, bottom = 8,
}

return config
