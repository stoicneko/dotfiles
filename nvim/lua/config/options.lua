-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.lsp.set_log_level("off")
vim.opt.timeoutlen = 150
vim.opt.backup = false
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- neovide 标题栏颜色
vim.g.neovide_title_background_color =
  string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)

-- 窗口左上角 字体颜色
vim.g.neovide_title_text_color = "pink"

-- 使用上一会话的窗口大小
vim.g.neovide_remember_window_size = true

-- 拼写检查
vim.opt.spell = true
vim.opt.spelllang = { "en", "cjk" }
vim.opt.spelloptions = "camel"

local indent = 2
-- vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.softtabstop = indent -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.tabstop = indent -- Number of spaces tabs count for
vim.opt.shiftwidth = indent -- Size of an indent

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- 启用行折叠
vim.opt.wrap = true
vim.opt.linebreak = true -- 在单词边界折行
vim.opt.breakindent = true -- 折行保持缩进
vim.opt.showbreak = "↳ " -- 折行处显示符号（可选）

if vim.g.neovide then
  require("config.neovide")
end
