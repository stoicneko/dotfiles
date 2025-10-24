return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
      opts.highlight.disable = { "latex" }

      opts.indent = opts.indent or {}
      opts.indent.enable = true
      opts.indent.disable = { "python" }

      opts.context_commentstring = { enable = true, enable_autocmd = false }

      opts.ensure_installed = {
        "bash",
        "c",
        "cpp",
        "html",
        "json",
        "latex",
        "lua",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "scala",
        "toml",
        "vim",
        "yaml",
      }

      opts.incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "<cr>",
          scope_incremental = "\\",
          node_decremental = "<bs>",
        },
      }

      return opts
    end,
  },
}
