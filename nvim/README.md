# Personal Neovim Config

Neovim setup built on top of [LazyVim](https://lazyvim.org) with a focus on a clean UI, fast navigation, and a sensible Windows/WSL workflow.

## Requirements
- Neovim **0.10+** (needed for WSL detection and Lazy loading quirks)
- Git (for [`lazy.nvim`](https://github.com/folke/lazy.nvim) bootstrapping)
- Optional: [Yazi](https://github.com/sxyazi/yazi) for the floating file manager, `im-select.exe` for IME switching

## Highlights
- Lazy-loaded plugin management via `lazy.nvim`
- Theme stack featuring NeoSolarized (default) plus GitHub, Gruvbox, Kanagawa, Nightfox, Tokyonight, and Miasma variants
- `mini.files` bound to `<leader>e` / `<leader>E` for quick directory jumps with smart fallbacks when editing unsaved buffers
- Treesitter tuned for code navigation (incremental selection on `<CR>` / `<BS>`) and contextual comments
- WSL-friendly input method switching through `my-im-select.nvim`
- Yazi-powered floating file manager (`<leader>J`, `<leader>cw`) for snappy navigation

## Layout
```
init.lua
lua/
  config/    -- core options, keymaps, autocmds, neovide settings
  plugins/   -- plugin specifications split by domain
stylua.toml  -- formatting rules (2 spaces, width 120)
```

## Usage
1. Clone or symlink this directory to `~/.config/nvim`.
2. Ensure `im-select.exe` exists at `/mnt/d/Tools/im-select.exe` (or adjust the path in `lua/plugins/my-im-select.lua`).
3. Launch Neovim; the first boot will install all plugins automatically (`:Lazy sync` to update later).
4. For Neovide users, tweak `lua/config/neovide.lua` to match personal font and opacity preferences.

## Notes
- The configuration avoids auto-commenting new lines and unmaps `<S-j>/<S-k>` in normal mode to prevent accidental buffer switches.
- Toggle Yazi session restore by uncommenting the binding in `lua/plugins/terminal.lua` once your Yazi build supports `toggle`.
