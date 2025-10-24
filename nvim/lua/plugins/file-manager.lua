return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    opts = {
      filesystem = {
        window = {
          mappings = {
            ["o"] = "system_open",
          },
        },
        commands = {
          system_open = function(state)
            local node = state.tree:get_node()
            local path = node and node:get_id()
            if not path then
              return
            end
            local opened = false

            if vim.ui.open then
              opened = pcall(vim.ui.open, path)
            end

            if opened then
              return
            end

            local ok, Util = pcall(require, "lazyvim.util")
            if ok and Util.open then
              Util.open(path)
            else
              vim.notify(string.format("Opening %s failed", path), vim.log.levels.WARN)
            end
          end,
        },
      },
    },
  },
  {
    "nvim-mini/mini.nvim",
    -- opts = {
    --   options = {
    --     use_as_default_explorer = true,
    --   },
    -- },
    keys = {
      {
        "<leader>e",
        function()
          local current = vim.api.nvim_buf_get_name(0)
          if current == "" then
            local uv = vim.uv or vim.loop
            current = uv.cwd()
          end
          require("mini.files").open(current, true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
      {
        "<leader>E",
        function()
          local uv = vim.uv or vim.loop
          require("mini.files").open(uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
  },
}
