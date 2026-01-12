return {
  {
    "nvim-telescope/telescope.nvim",
    cond = not vim.g.vscode,
    keys = {
      { mode = "n", "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
      { mode = "n", "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
      { mode = "n", "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
      { mode = "n", "<leader>fh", "<cmd>Telescope help_tags", desc = "Telescope help tags" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
}
