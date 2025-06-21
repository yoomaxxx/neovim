return {
  {
    "stevearc/conform.nvim",
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
          python = {
            "ruff_fix",
            "ruff_format",
            "ruff_organize_imports",
          },
          zsh = { "shfmt" },
          toml = { lsp_format = "prefer" },
          yaml = { "yamlfix" },
          dockerfile = { lsp_format = "prefer" },
        },
      })
    end,
  },
}
