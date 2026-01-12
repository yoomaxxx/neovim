return {{
  "folke/which-key.nvim",
  event = "VeryLazy",
  conf = not vim.g.vscode,
  opts = {
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
}
