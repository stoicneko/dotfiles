-- lua/nova-scheme/highlights.lua
local M = {}

function M.get(colors, options)
  local highlights = {
    -- 基础元素
    Normal = { fg = colors.fg, bg = options.transparent_bg and "NONE" or colors.bg },
    Comment = { fg = colors.comment_grey, gui = options.italic_comments and "italic" or "NONE" },
    String = { fg = colors.green },
    Number = { fg = colors.yellow },
    Keyword = { fg = colors.purple, gui = "italic" },
    Function = { fg = colors.brightGreen },
    Type = { fg = colors.cyan },
    Operator = { fg = colors.red },
    Constant = { fg = colors.cyan },
    Identifier = { fg = colors.blue },
    Statement = { fg = colors.purple },
    Error = { fg = colors.red, bg = colors.ui_grey },

    -- UI
    LineNr = { fg = colors.brightBlack },
    CursorLine = { bg = colors.ui_grey },
    CursorLineNr = { fg = colors.yellow, gui = "bold" },
    Pmenu = { fg = colors.fg, bg = colors.ui_grey },
    PmenuSel = { bg = colors.blue },
    Visual = { bg = colors.ui_grey },
    WinSeparator = { fg = colors.brightBlack },

    -- Treesitter (示例)
    ["@variable"] = { fg = colors.fg },
    ["@parameter"] = { fg = colors.white },
    ["@string"] = { fg = colors.green },
    ["@function"] = { fg = colors.brightGreen },
    ["@keyword"] = { fg = colors.purple },
    ["@type"] = { fg = colors.cyan },
    ["@comment"] = { fg = colors.comment_grey, gui = options.italic_comments and "italic" or "NONE" },

    -- LSP (示例)
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
  }
  return highlights
end

return M
