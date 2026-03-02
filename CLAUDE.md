# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for Arch Linux and ArchWSL, managed with [dotbot](https://github.com/anishathalye/dotbot) (vendored as a git submodule in `dotbot/`).

## Install

```bash
./install          # runs dotbot: creates symlinks, inits submodules
```

This executes `dotbot/bin/dotbot` with the mapping in `install.conf.yaml`.

## Repository Structure

| Directory | Target | Notes |
|-----------|--------|-------|
| `fish/` | `~/.config/fish/` | Fish shell — individual files/dirs symlinked (not the whole directory) |
| `nvim/` | `~/.config/nvim/` | Neovim — LazyVim-based config (`lazyvim.json`, `lazy-lock.json`) |
| `tmux/` | `~/.tmux.conf` + `~/.tmux/` | Tmux — plugins via git submodules (catppuccin theme, tmux-sensible) |
| `yazi/` | `~/.config/yazi/` | Yazi file manager — custom linemode, starship plugin |
| `fastfetch/` | `~/.config/fastfetch/` | Fastfetch system info |
| `btop/` | `~/.config/btop/` | Btop resource monitor |
| `dotbot/` | — | Dotbot submodule (do not edit) |

## Key Architecture Details

- **Dotbot** handles all symlinking. Edit `install.conf.yaml` to add/change link targets. Links have `relink: true` and `create: true` defaults.
- **Fish** uses a modular `conf.d/` structure with numbered prefixes (00, 05, 20, 30, 35, 60, 90) controlling load order. `config.fish` is intentionally minimal. See `fish/CLAUDE.md` for details.
- **Fish plugins** are managed by [Fisher](https://github.com/jorgebucaran/fisher) — update with `fisher update`. Don't hand-edit Fisher-managed files.
- **Tmux plugins** are git submodules under `tmux/.tmux/plugins/` (catppuccin, tmux-sensible).
- **Nvim** is a LazyVim distribution — plugins locked via `lazy-lock.json`.
- **Yazi** has a custom starship header plugin and a `size_and_mtime` linemode. See `yazi/CLAUDE.md` for details.

## Conventions

- Each tool's config lives in its own top-level directory — never scatter configs across directories.
- Git submodules are used for dotbot and tmux plugins; run `git submodule update --init --recursive` after cloning.
- Fish `conf.d/` files guard with `status is-interactive; or exit`; tool integrations guard with `type -q <tool>`.
