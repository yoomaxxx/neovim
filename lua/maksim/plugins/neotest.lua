return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      require("maksim.config.platform").linux("rcasia/neotest-bash"),
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-python",
    },
    cond = not vim.g.vscode,
    keys = {
      { "<leader>ta", "<CMD>Neotest attach<CR>", { silent = true } },
      { "<leader>tl", "<CMD>Neotest run last<CR>", { silent = true } },
      { "<leader>to", "<CMD>Neotest output<CR>", { silent = true } },
      { "<leader>tO", "<CMD>Neotest output_panel<CR>", { silent = true } },
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        { silent = true },
      },
      { "<leader>ts", "<CMD>Neotest summary toggle<CR>", { silent = true } },
      { "<leader>tS", "<CMD>Neotest stop<CR>", { silent = true } },
      {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        { silent = true },
      },
      { "<leader>tT", "<CMD>Neotest run file<CR>", { silent = true } },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand("%"))
        end,
        { silent = true },
      },
    },
    config = function()
      local platform = require("maksim.config.platform")
      local adapters = {
        require("neotest-python"),
        require("neotest-vitest"),
      }
      if not platform.is_windows then
        table.insert(adapters, require("neotest-bash"))
      end

      require("neotest").setup({
        adapters = adapters,
      })
    end,
  },
}
