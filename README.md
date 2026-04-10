# Vimemo

A minimal memo app powered by WezTerm + Neovim.

## Requirements

- macOS
- [WezTerm](https://wezfurlong.org/wezterm/)
- [Neovim](https://neovim.io/)

## Install

```bash
git clone <repo-url>
cd vimemo
./build.sh --install
```

Installs `Vimemo.app` to `/Applications`.

## Usage

- Open `/Applications/Vimemo.app`
- Or run `./vimemo.sh` directly

Memos are saved as `~/.vimemo/YYYY-MM-DD.md`, one file per day.

## Files

```
vimemo.sh              # Main launcher
wezterm-vimemo.lua     # WezTerm config for the memo window
build.sh               # Build & install .app bundle
```

## Build

```bash
./build.sh             # Build Vimemo.app
./build.sh --install   # Build + copy to /Applications
```
