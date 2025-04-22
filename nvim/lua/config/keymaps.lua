-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- 取消 <S-j> 和 <S-k> 的映射
vim.keymap.set("n", "<S-j>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-k>", "<Nop>", { noremap = true, silent = true })
