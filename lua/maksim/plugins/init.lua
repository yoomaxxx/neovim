return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    cond = not vim.g.vscode,
    config = function()
      vim.cmd([[colorscheme tokyonight-storm]])
    end,
  },
  { "mbbill/undotree", cond = not vim.g.vscode },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
  },
  {
    "gbprod/cutlass.nvim",
    event = "VeryLazy",
    opts = {
      cut_key = "m",
      override_del = "d",
      exclude = {},
      registers = {
        select = "_",
        delete = "_",
        change = "_",
      },
    },
  },
  { "tpope/vim-fugitive" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    cond = not vim.g.vscode,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    url = "https://github.com/nvimdev/indentmini.nvim",
    cmd = { "IndentToggle", "IndentEnable", "IndentDisable" },
    keys = {
      { "<space>it", "<Cmd>IndentToggle<CR>", desc = "Toggle indent guides" },
    },
    event = { "BufEnter" },
    cond = not vim.g.vscode,
    lazy = true,
    opts = {
      only_current = false,
      enabled = true,
      char = "▏",
      minlevel = 2,
      exclude = { "markdown", "help", "text", "rst" },
      exclude_nodetype = { "string", "comment" },
    },
  },
  { "tpope/vim-repeat" },
  { "tpope/vim-obsession", cond = not vim.g.vscode },
  { "tmux-plugins/vim-tmux", cond = not vim.g.vscode },
  {
    "christoomey/vim-tmux-navigator",
    cond = not vim.g.vscode,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  { "ellisonleao/dotenv.nvim", cond = not vim.g.vscode },
}
