-- lua/nova-scheme/config.lua
local M = {}

M.defaults = {
  italic_comments = true, -- 示例选项：是否使用斜体注释
  transparent_bg = false, -- 示例选项：是否使用透明背景
  -- 在这里添加更多你想要的配置
}

M.options = {}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
