# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Structure

This is a Yazi file manager configuration repository containing:

- **Main Yazi config**: `yazi.toml` - Core Yazi settings including file sorting, preview, and opener rules
- **Lua initialization**: `init.lua` - Custom Lua functions and plugin setup
- **Starship plugin**: `plugins/starship.yazi/` - Third-party plugin for Starship prompt integration

### Key Configuration Files

- `yazi.toml`: Contains manager settings (sort by modified time, show hidden files), preview limits, and file opening rules for different applications (nvim, zathura, qimgv, inkscape)
- `init.lua`: Sets up the Starship plugin and defines a custom `Linemode:size_and_mtime()` function for displaying file size and modification time
- `plugins/starship.yazi/main.lua`: Plugin implementation that replaces the default header with Starship prompt output

### Plugin Architecture

The Starship plugin works by:
1. Replacing the default header widget in `setup()`
2. Running `starship prompt` command when directory changes occur
3. Caching the output and re-rendering the header
4. Supporting custom config files and flag positioning options

## Development Commands

### Lua Formatting
- Use stylua for Lua code formatting
- Configuration available in `plugins/starship.yazi/stylua.toml`
- Format with: `stylua plugins/starship.yazi/main.lua`

### Yazi Package Management
- Install plugins: `ya pkg add <repository>`
- Plugin installation directory: `~/.config/yazi/plugins/`

## Dependencies

- **Yazi** (v25.4.8+) - File manager
- **starship** - Custom shell prompt (required for the plugin)
- **nvim** - Default editor (configured in yazi.toml)

## File Operations

The configuration includes specialized openers for:
- PDF files: sioyek, zathura
- LaTeX files: nvim editor
- SVG files: inkscape
- Images: qimgv, reveal
- Default text editing: nvim

## Custom Functions

### Linemode:size_and_mtime()
Located in `init.lua:4-16`, this function formats file display to show:
- Human-readable file size
- Formatted modification time (current year: "Mon DD HH:MM", other years: "Mon DD  YYYY")