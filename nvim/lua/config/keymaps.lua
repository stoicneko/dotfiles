-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 取消 <S-j> 和 <S-k> 的映射
map("n", "<S-j>", "<Nop>", opts)
map("n", "<S-k>", "<Nop>", opts)
