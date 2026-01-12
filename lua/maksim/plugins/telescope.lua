return {
  {
    "nvim-telescope/telescope.nvim",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
}
