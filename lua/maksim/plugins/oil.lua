return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    cond = not vim.g.vscode,
    event = "BufEnter",
    keys = { { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } } },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
  },
}
