return {
  {
    "stoicneko/my-im-select.nvim",
    event = "VeryLazy",
    opts = {
      im_select_path = "/mnt/d/Tools/im-select.exe",

      default_im_id = "1033", -- 你的英文输入法 ID
      chinese_im_id = "2052", -- 你的中文输入法 ID
    },
    config = function(_, opts)
      require("my-im-select").setup(opts)
    end,
  },
}
