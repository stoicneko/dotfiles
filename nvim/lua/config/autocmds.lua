-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local autocmd = vim.api.nvim_create_autocmd

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "terminal",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- reload colorscheme for matugen
vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = function()
    vim.cmd("Lazy reload catppuccin")
    vim.cmd("Lazy reload lualine.nvim")
    vim.cmd("Lazy reload bufferline.nvim")
  end,
})
