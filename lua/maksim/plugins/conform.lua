return {
  {
    "stevearc/conform.nvim",
    cond = not vim.g.vscode,
    config = function()
      require("conform").setup({
        formatters = {
          yamlfix = {
            command = "yamlfix",
            env = {
              YAMLFIX_EXPLICIT_START = false,
            },
          },
        },
        formatters_by_ft = {
          lua = { "stylua" },
          sh = { "shfmt" },
          zsh = { "shfmt" },
          toml = { lsp_format = "prefer" },
          yaml = { "yamlfix" },
          dockerfile = { lsp_format = "prefer" },
          json = { lsp_format = "prefer" },
          jinja = { "djlint" },
          htmldjango = { "djlint" },
          html = { lsp_format = "prefer" },
          python = {
            "ruff_fix",
            "ruff_format",
            "ruff_organize_imports",
          },
          markdown = { "markdownlint" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          svelte = { "prettier" },
          vue = { "prettier" },
        },
      })
    end,
  },
}
