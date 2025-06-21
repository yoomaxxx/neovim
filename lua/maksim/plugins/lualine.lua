return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cond = not vim.g.vscode,
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
      },
      sections = {
        lualine_z = {
          {
            require("opencode").statusline,
          },
        },
      },
    })
  end,
}
