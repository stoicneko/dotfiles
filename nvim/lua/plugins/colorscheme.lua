return {
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- style = "light",
      transparent = true,
    },
  },
  { "projekt0n/github-nvim-theme" },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      italic = {
        strings = true,
        operators = false,
        comments = true,
      },
      contrast = "hard",
    },
  },
  { "rebelot/kanagawa.nvim" },
  { "xero/miasma.nvim" },
  { "EdenEast/nightfox.nvim" },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
      },
    },
  },
}
