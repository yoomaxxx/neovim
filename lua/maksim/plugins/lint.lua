return {
  {
    "mfussenegger/nvim-lint",
    cond = not vim.g.vscode,
    config = function()
      require("lint").linters_by_ft = {
        markdown = { "markdownlint" },
      }
    end,
  },
}
