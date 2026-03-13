# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

LazyVim-based Neovim config (v8) with moderate customization, targeting Arch Linux / ArchWSL with optional Neovide GUI support.

## Plugin Architecture

`lua/config/lazy.lua` controls import order — this matters:

1. `lazyvim.plugins` — LazyVim defaults loaded first
2. `plugins.default` — overrides/tweaks applied to those defaults
3. `plugins` — additional custom plugins loaded last

### `lua/plugins/default/` — LazyVim Override Layer

| File | What it does |
|------|-------------|
| `default.lua` | Colorscheme (NeoSolarized), clangd UTF-16 fix, `mini.surround` remapped to `m` prefix, `mini.ai` treesitter textobjects |
| `disabled.lua` | Disables noice.nvim, friendly-snippets, nvim-spectre, catppuccin, todo-comments; unbinds `<S-h>`/`<S-l>` from bufferline |
| `blink.lua` | `<Tab>`/`<S-Tab>` completion cycling, bordered windows |
| `conform.lua` | `jq` as JSON/JSONC formatter |
| `fzf.lua` | Unbinds `<leader>gc`/`<leader>gs` from fzf-lua |
| `snacks.lua` | Dashboard with cowsay + dotfiles picker, indent chunks, frecency picker, `<C-/>` terminal in file dir, `]]`/`[[` word refs |
| `tree-sitter.lua` | Curated `ensure_installed` list, incremental selection (`<CR>`/`<BS>`/`\`), disables highlight for LaTeX and indent for Python |

### `lua/plugins/` — Custom Additions

| File | Key plugins |
|------|------------|
| `colorscheme.lua` | NeoSolarized (primary, transparent), plus 6 alternatives |
| `file-manager.lua` | mini.files replaces neo-tree (`<leader>e`/`<leader>E`) |
| `my-im-select.lua` | WSL input method switcher (`/mnt/d/Tools/im-select.exe`, EN 1033 / CN 2052) |
| `terminal.lua` | nvim-highlight-colors |
| `utils.lua` | nvim-ufo code folding (treesitter+indent) |

## Config Layer (`lua/config/`)

- `options.lua` — `timeoutlen=150`, 2-space indent, line wrap with `↳` showbreak, clipboard deferred via `vim.schedule`
- `keymaps.lua` — Only disables `<S-j>` and `<S-k>` defaults
- `autocmds.lua` — Strips `c/r/o` from `formatoptions`; `q` closes terminal buffers
- `neovide.lua` — Loaded conditionally when `g.neovide` is set; NeoSolarized terminal palette, Maple Mono NF CN font, 0.6 opacity, pixiedust cursor

## Conventions

- New LazyVim default overrides go in `lua/plugins/default/`. New standalone plugins go in `lua/plugins/`.
- Formatting: `stylua` (config in `stylua.toml`).
- LazyVim extras are declared in `lazyvim.json` (clangd, java, python, json, markdown, toml, mini-surround).
