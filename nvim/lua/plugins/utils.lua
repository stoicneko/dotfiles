return {
  {
    "abecodes/tabout.nvim",
    enabled = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
    lazy = true,
    opts = {
      tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
      backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
      act_as_tab = true, -- shift content if tab out is not possible
      act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
      default_shift_tab = "<C-w>", -- reverse shift default action,
      enable_backwards = true, -- well ...
      completion = true,
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "$", close = "$" },
      },
      -- if the cursor is at the beginning of a filled element it will tab out instead of shifting content
      ignore_beginning = true,
      exclude = {}, -- tabout will ignore these filetypes
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    },
  },
  {
    "brianhuster/autosave.nvim",
    enabled = false,
    event = "InsertEnter",
    opts = {}, -- Configuration here
    keys = {
      { "<leader>ut", "<cmd>Autosave toggle<cr>", desc = "Toggle autosave" },
    },
  },
}
