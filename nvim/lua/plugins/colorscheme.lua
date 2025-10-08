return {
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,
    priortity = 1000,
    -- opts = {
    --   style = "light",
    transparent = true,
    -- },
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = true, -- Load theme eagerly on startup
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true, -- Load theme eagerly on startup
    opts = {
      -- Mapped from your original 'setup' table
      italic = {
        strings = true,
        operators = false,
        comments = true,
      },
      contrast = "hard",
    },
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = true, -- Load theme eagerly on startup
  },

  {
    "xero/miasma.nvim",
    lazy = true,
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },
  {

    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon", -- Styles: "storm", "night", "day", "moon"
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
      },
    },
  },
}
