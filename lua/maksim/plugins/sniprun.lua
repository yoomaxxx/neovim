return {
  "michaelb/sniprun",
  branch = "master",
  cond = not vim.g.vscode and not require("maksim.config.platform").is_windows,
  build = "sh install.sh",
  keys = {
    { mode = { "v", "n" }, "<leader>r", "<Plug>SnipRun", { silent = true } },
    { "<leader>f", "<Plug>SnipRunOperator", { silent = true } },
  },
  opts = {},
}
