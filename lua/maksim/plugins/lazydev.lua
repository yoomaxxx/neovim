return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cond = not vim.g.vscode,
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
