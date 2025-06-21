return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  cond = not vim.g.vscode,
  keys = {
    { "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Telescope find files" } },
    { "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Telescope live grep" } },
    { "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Telescope buffers" } },
    { "<leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "Telescope help tags" } },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local actions = require("telescope.actions")
    local open_with_trouble = require("trouble.sources.telescope").open

    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            width = { padding = 0 },
            height = { padding = 0 },
            preview_width = 0.5,
          },
        },
        mappings = {
          i = {
            ["<c-t>"] = open_with_trouble,
            ["<c-d>"] = actions.delete_buffer,
          },
          n = {
            ["<c-t>"] = open_with_trouble,
            ["<c-d>"] = actions.delete_buffer,
            ["dd"] = actions.delete_buffer,
          },
        },
      },
    })
  end,
}
