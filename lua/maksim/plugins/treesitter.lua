return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    config = function()
      local treesitter = require("nvim-treesitter")
      local parsers = {
        "regex",
        "lua",
        "gitignore",
        "json",
        "toml",
        "yaml",
        "python",
        "bash",
        "jinja",
        "jinja_inline",
      }
      for _, parser in ipairs(parsers) do
        treesitter.install(parser)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = parsers,
        callback = function()
          vim.treesitter.start()
        end,
      })

      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo[0][0].foldmethod = "expr"

      vim.api.nvim_command("set nofoldenable")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter", branch = "main" },
    init = function()
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        textobjects = {
          move = {
            enable = true,
            set_jumps = true,
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
}
