return {
  {
    "mfussenegger/nvim-dap",
    cond = not vim.g.vscode,
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        { silent = true },
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        { silent = true },
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        { silent = true },
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
      },
      {
        "<Leader>b",
        function()
          require("dap").toggle_breakpoint()
        end,
        { silent = true },
      },
      {
        "<Leader>B",
        function()
          require("dap").set_breakpoint()
        end,
        { silent = true },
      },
      {
        "<Leader>lp",
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end,
        { silent = true },
      },
      {
        "<Leader>dr",
        function()
          require("dap").repl.open()
        end,
        { silent = true },
      },
      {
        "<Leader>dl",
        function()
          require("dap").run_last()
        end,
        { silent = true },
      },
      {
        "<leader>dv",
        function()
          require("dap-view").toggle()
        end,
        { silent = true },
      },
    },
    config = function()
      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
    end,
  },
  {
    "igorlfs/nvim-dap-view",
    cond = not vim.g.vscode,
    opts = {},
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap-python",
    cond = not vim.g.vscode,
    config = function()
      require("dap-python").setup("uv")
    end,
  },
}
