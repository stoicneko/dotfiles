-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.lsp.set_log_level("off")
vim.opt.timeoutlen = 150
vim.opt.spell = true
vim.opt.spelllang = { "en", "cjk" }
vim.opt.spelloptions = "camel"
vim.opt.backup = false
vim.g.maplocalleader = " "
vim.g.mapleader = " "

local indent = 2
-- vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.softtabstop = indent -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.tabstop = indent -- Number of spaces tabs count for
vim.opt.shiftwidth = indent -- Size of an indent

-- vim.schedule(function()
--   vim.opt.clipboard = "unnamedplus"
-- end)
--

-- if vim.fn.has("wsl") == 1 then
--   vim.g.clipboard = {
--     name = "WslClipboard",
--     copy = {
--       ["+"] = "/mnt/c/Windows/System32/clip.exe",
--       ["*"] = "/mnt/c/Windows/System32/clip.exe",
--     },
--     paste = {
--       ["+"] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--       ["*"] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     },
--     cache_enabled = 0,
--   }
-- end

if vim.g.neovide then
  require("config.neovide")
end
