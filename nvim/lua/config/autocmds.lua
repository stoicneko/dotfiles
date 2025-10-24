-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
  group = augroup("custom_formatoptions", { clear = true }),
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Don't auto comment new lines",
})

autocmd("FileType", {
  group = augroup("close_with_q", { clear = true }),
  pattern = { "terminal" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
  desc = "Close window with q",
})

-- reload colorscheme for matugen
-- vim.api.nvim_create_autocmd("Signal", {
--   pattern = "SIGUSR1",
--   callback = function()
--     vim.cmd("Lazy reload catppuccin")
--     vim.cmd("Lazy reload lualine.nvim")
--     vim.cmd("Lazy reload bufferline.nvim")
--   end,
-- })
