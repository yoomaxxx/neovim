return {
  {
    "OXY2DEV/markview.nvim",
    dependecies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
}
