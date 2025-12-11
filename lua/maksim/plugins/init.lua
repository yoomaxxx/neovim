return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
  },
  {
    "gbprod/cutlass.nvim",
    event = "VeryLazy",
    opts = {
      cut_key = "m",
      override_del = "d",
      exclude = {},
      registers = {
        select = "_",
        delete = "_",
        change = "_",
      },
    }
  }
}
