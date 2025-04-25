-- NeoSolarized 终端颜色
vim.g.terminal_color_0 = "#002b36" -- 黑（背景）
vim.g.terminal_color_1 = "#dc322f" -- 红
vim.g.terminal_color_2 = "#859900" -- 绿
vim.g.terminal_color_3 = "#b58900" -- 黄
vim.g.terminal_color_4 = "#268bd2" -- 蓝
vim.g.terminal_color_5 = "#d33682" -- 洋红
vim.g.terminal_color_6 = "#2aa198" -- 青
vim.g.terminal_color_7 = "#eee8d5" -- 白（前景）
vim.g.terminal_color_8 = "#073642" -- 亮黑
vim.g.terminal_color_9 = "#cb4b16" -- 亮红
vim.g.terminal_color_10 = "#586e75" -- 亮绿
vim.g.terminal_color_11 = "#657b83" -- 亮黄
vim.g.terminal_color_12 = "#839496" -- 亮蓝
vim.g.terminal_color_13 = "#6c71c4" -- 亮洋红
vim.g.terminal_color_14 = "#93a1a1" -- 亮青
vim.g.terminal_color_15 = "#fdf6e3" -- 亮白

-- font
-- vim.o.guifont = "DejaVuSansM Nerd Font Mono:h12"
vim.o.guifont = "Maple Mono NF CN:h12"

-- 强制每帧重绘
vim.g.neovide_no_idle = true
-- ui
vim.g.neovide_cursor_vfx_mode = "pixiedust"
-- vim.g.neovide_transparency = 0
vim.g.neovide_normal_opacity = 0.6

-- keymaps
vim.keymap.set({ "i", "t" }, "<a-v>", "<esc>pa")

-- -- fix neovide terminal color(catppuccin)
-- vim.g.terminal_color_0 = "#45475a"
-- vim.g.terminal_color_1 = "#f38ba8"
-- vim.g.terminal_color_2 = "#a6e3a1"
-- vim.g.terminal_color_3 = "#f9e2af"
-- vim.g.terminal_color_4 = "#89b4fa"
-- vim.g.terminal_color_5 = "#f5c2e7"
-- vim.g.terminal_color_6 = "#94e2d5"
-- vim.g.terminal_color_7 = "#bac2de"
-- vim.g.terminal_color_8 = "#585b70"
-- vim.g.terminal_color_9 = "#f38ba8"
-- vim.g.terminal_color_10 = "#a6e3a1"
-- vim.g.terminal_color_11 = "#f9e2af"
-- vim.g.terminal_color_12 = "#89b4fa"
-- vim.g.terminal_color_13 = "#f5c2e7"
-- vim.g.terminal_color_14 = "#94e2d5"
-- vim.g.terminal_color_15 = "#a6adc8"
