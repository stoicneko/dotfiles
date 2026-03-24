# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Structure

This is a Yazi file manager configuration repository containing:

- `yazi.toml` — Core settings: sorting, preview limits, opener/open rules
- `init.lua` — Plugin setup and custom `Linemode:size_and_mtime()` function
- `plugins/starship.yazi/` — Starship prompt header plugin (committed directly, not a git submodule)

## Deployment

The entire `yazi/` directory is symlinked to `~/.config/yazi/` via dotbot (`install.conf.yaml` in the parent repo). Edits here take effect immediately — no copy step needed.

## Development Commands

Format Lua code:
```bash
stylua plugins/starship.yazi/main.lua
```

Install new plugins:
```bash
ya pkg add <repository>
```

## Plugin Architecture

The starship plugin (`plugins/starship.yazi/main.lua`) replaces the default header widget:
1. `setup()` removes the default header and adds a custom renderer
2. Subscribes to `cd` and `tab` events to detect directory changes
3. `entry()` runs `starship prompt` with the current cwd, caches output via `ya.sync`
4. Supports `config_file`, `hide_flags`, and `flags_after_prompt` setup args

The plugin requires `@since 25.4.8` and handles API differences between Yazi versions (e.g. `ui.render` vs `ya.render`, `ya.emit` vs `ya.manager_emit`).

## Custom Linemode

`init.lua:4-16` defines `Linemode:size_and_mtime()` — referenced in `yazi.toml` as `linemode = "size_and_mtime"`. Shows human-readable file size and modification time (current year: `"Mon DD HH:MM"`, prior years: `"Mon DD  YYYY"`).

## Dependencies

- **Yazi** (v25.4.8+)
- **starship** — required for the header plugin
- **stylua** — Lua formatter (config in `plugins/starship.yazi/stylua.toml`)
