return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
  keys = {
    { "gd", "<CMD>Lspsaga goto_definition<CR>", { silent = true } },
    {
      "<C-w>gd",
      ":rightbelow vsplit | Lspsaga goto_definition<CR>",
      { silent = true },
    },
    { "gt", "<CMD>Lspsaga goto_type_definition<CR>", { silent = true } },
    {
      "<C-w>gt",
      ":rightbelow vsplit | Lspsaga goto_type_definition<CR>",
      { silent = true },
    },
    { "ca", "<CMD>Lspsaga code_action<CR>", { silent = true } },
    { "<leader>o", "<CMD>Lspsaga outline<CR>", { silent = true } },
    { "K", "<CMD>Lspsaga hover_doc<CR>", { silent = true } },
    { "<leader>cr", "<CMD>Lspsaga rename<CR>", { silent = true } },
  },

  -- vim.keymap.set(gi <Cmd>LspGotoImpl<CR>
  -- vim.keymap.set("n", "dl", "<CMD>Lspsaga show_line_diagnostics<CR>", { silent = true })
  -- vim.keymap.set("n", "dc", "<CMD>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
  -- vim.keymap.set("n", "db", "<CMD>Lspsaga show_buf_diagnostics<CR>", { silent = true })
  -- vim.keymap.set("n", "dw", "<CMD>Lspsaga show_workspace_diagnostics<CR>", { silent = true })

  -- vim.keymap.set("n", "dp", "<CMD>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
  -- vim.keymap.set("n", "dn", "<CMD>Lspsaga diagnostic_jump_next<CR>", { silent = true })

  -- vim.keymap.set(df <Cmd>LspDiagFirst<CR>
  -- vim.keymap.set(dl <Cmd>LspDiagLast<CR>

  -- vim.keymap.set( g] <cmd>LspPeekDefinition<cr>
  --
}
