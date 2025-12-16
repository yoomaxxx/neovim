return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
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
