return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "rcasia/neotest-bash",
    },
    cond = not vim.g.vscode,
    ft = { "python", "lua", "sh", "bash" },
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
      require("neotest").setup({
        adapters = {
          require("neotest-python"),
          require("neotest-bash"),
        },
      })
    end,
  },
}
