return {
  {
    "nvimdev/guard.nvim",
    dependencies = {
      "nvimdev/guard-collection",
    },
    config = function()
      local ft = require("guard.filetype")

      ft("lua"):fmt("stylua")
      ft("sh"):fmt("shfmt")
      ft("yaml"):fmt("yamlfix")
      ft("typescript,javascript,typescriptreact,javascriptreact"):fmt("prettier")

      ft("toml"):fmt("taplo")
    end,
  },
}
