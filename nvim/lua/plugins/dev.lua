return {
  -- "YourUsername/kiruna.nvim", -- 如果上传到 GitHub
  dir = "~/Documents/dev/kiruna.nvim", -- 如果是本地测试
  lazy = false, -- 配色方案必须在启动时加载
  priority = 1000, -- 确保它优先于其他插件
  opts = {
    -- 在这里覆盖默认配置，例如:
    transparent_background = true,
    italic_comments = false,
  },
  -- config = function(_, opts)
  --   -- 首先设置配置
  --   require("kiruna").setup(opts)
  --   -- 然后应用配色方案
  --   --   vim.cmd.colorscheme("kiruna")
  --   end,
}
