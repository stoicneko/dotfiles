# Dotfiles

My personal dotfiles, managed with [dotbot](https://github.com/anishathalye/dotbot) and used in Arch Linux and ArchWSL.

## Install

```bash
git clone --recursive https://github.com/stoicneko/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install
```

This creates all symlinks defined in `install.conf.yaml` and initializes git submodules.

## What's Included

| Directory | Target | Description |
|-----------|--------|-------------|
| `fish/` | `~/.config/fish/` | Fish shell with modular `conf.d/` structure |
| `nvim/` | `~/.config/nvim/` | Neovim (LazyVim) with NeoSolarized theme |
| `tmux/` | `~/.tmux.conf` + `~/.tmux/` | Tmux with catppuccin theme |
| `yazi/` | `~/.config/yazi/` | Yazi file manager with starship header |
| `fastfetch/` | `~/.config/fastfetch/` | Fastfetch with random logo |
| `btop/` | `~/.config/btop/` | Btop with Everforest Dark theme and vim mode |

## Fish Shell

Plugins managed by [Fisher](https://github.com/jorgebucaran/fisher):

- [tide](https://github.com/ilancosman/tide) — prompt theme
- [nvm.fish](https://github.com/jorgebucaran/nvm.fish) — Node.js version manager

`conf.d/` files (loaded in order by numbered prefix):

| File | Purpose |
|------|---------|
| `00-environment.fish` | Core env vars (EDITOR, LANG, XDG dirs, AUR helper) |
| `05-paths.fish` | PATH additions (`~/.local/bin`, `~/bin`, `~/.npm-global/bin`) |
| `10-proxy.fish` | HTTP/HTTPS proxy (localhost:7890) |
| `20-keybindings.fish` | Vi key bindings |
| `30-shortcuts.fish` | Aliases and abbreviations (eza, nvim, git, paru) |
| `60-tools.fish` | Tool integrations (zoxide) |
| `90-tmux.fish` | Tmux auto-attach (commented out) |

Custom functions: `j` (zoxide jump), `a` (yazi with cd-on-exit), `vf` (fzf + nvim), `upd` (quick git push), `gitlog` (pretty git log).

## Neovim

Based on [LazyVim](https://www.lazyvim.org/) with extras for Go, Python, Java, JSON, Markdown, and TOML. Colorscheme: NeoSolarized (transparent). Includes nvim-ufo (code folding), mini.files, fzf-lua, and WSL input method switching.

## Tmux

Modular config via `conf.d/`:

- 256-color terminal, mouse support, base-index 1
- Vi copy-mode with vim-tmux-navigator (`C-h/j/k/l`)
- Plugins: [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible), [catppuccin](https://github.com/catppuccin/tmux)

## CI

GitHub Actions runs on every push/PR to `main`:

- Fish syntax check
- Lua format check (StyLua)
- YAML lint
- Dotbot install test
