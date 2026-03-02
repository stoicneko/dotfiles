# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is the Fish shell configuration portion of a personal dotfiles repo, managed with [dotbot](https://github.com/anishathalye/dotbot). It targets Arch Linux and ArchWSL. Dotbot symlinks individual fish dirs (`conf.d`, `functions`, `completions`, `themes`) and files (`config.fish`, `fish_plugins`, `fish_variables`) into `~/.config/fish/`.

## Setup

From the dotfiles root: `./install` — runs dotbot to create all symlinks and initialize submodules.

Fish plugins are managed with [Fisher](https://github.com/jorgebucaran/fisher). Install/update plugins: `fisher update`.

## Architecture

`config.fish` is intentionally minimal — it exists only for per-host overrides. All real configuration lives in `conf.d/` files, which Fish sources in lexicographic order:

| File | Purpose |
|------|---------|
| `00-environment.fish` | Core env vars (EDITOR, LANG, XDG dirs, `aurhelper`) |
| `05-paths.fish` | PATH additions (`~/.local/bin`) |
| `20-keybindings.fish` | Vi key bindings (`fish_vi_key_bindings`) |
| `30-aliases.fish` | Aliases (navigation, eza/exa, nvim, tmux, yazi config shortcuts) |
| `35-abbreviations.fish` | Abbreviations (git, paru/AUR helper, btop, clear) |
| `60-tools.fish` | Tool shell integrations (zoxide, starship) — guarded by `type -q` |
| `90-tmux.fish` | Tmux auto-attach (commented out by default) |

Custom functions in `functions/`:
- `j` — zoxide jump with cd fallback
- `a` — yazi file manager with cd-on-exit
- `vf` — fzf file picker into nvim
- `upd` — quick git pull/add-all/commit "update"/push
- `gitlog` — pretty git log graph

## Conventions

- All `conf.d/` and `functions/` files that need an interactive shell guard with `status is-interactive; or exit` (conf.d) or check tool availability with `type -q <tool>` before use.
- Numbered prefixes on `conf.d/` files control load order — keep the numbering scheme when adding new files.
- The AUR helper is configured via the `$aurhelper` variable (set in `00-environment.fish`, currently `paru`). Abbreviations in `35-abbreviations.fish` reference it.
- Fisher-managed files (`fisher.fish`, `nvm.fish` and related `_nvm_*` functions) should not be hand-edited; they are controlled by `fish_plugins`.
