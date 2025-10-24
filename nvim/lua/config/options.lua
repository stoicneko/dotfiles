-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.lsp.set_log_level("off")

local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = " "

opt.timeoutlen = 150
opt.backup = false

local indent = 2
-- opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = indent
opt.shiftwidth = indent
opt.softtabstop = indent

vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)

-- Wrap and indent visualization
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↳ "

-- opt.spell = true
-- opt.spelllang = { "en", "cjk" }
-- opt.spelloptions = "camel"

if g.neovide then
  local ok, normal = pcall(vim.api.nvim_get_hl, 0, { name = "Normal", link = false })
  if ok then
    local bg = normal.bg or 0
    g.neovide_title_background_color = string.format("%x", bg)
  end
  g.neovide_title_text_color = "pink"
  g.neovide_remember_window_size = true

  require("config.neovide")
end
