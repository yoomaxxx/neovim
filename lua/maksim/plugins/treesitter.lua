return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
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
        "vim",
        "vimdoc",
        "zsh",
        "markdown",
        "markdown_inline",
      }

      treesitter.install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter.setup", {}),
        callback = function(args)
          local buf = args.buf
          local filetype = args.match

          local language = vim.treesitter.language.get_lang(filetype) or filetype
          if not vim.treesitter.language.add(language) then
            return
          end

          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

          vim.treesitter.start(buf, language)

          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo[0][0].foldmethod = "expr"

      vim.api.nvim_command("set nofoldenable")
    end,
  },
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local ts = require("treesitter-modules")
      ts.setup({
        highlight = { enable = true },
      })
      vim.keymap.set("n", "sr", ts.init_selection)
      vim.keymap.set("x", "sr", ts.node_incremental)
      vim.keymap.set("x", "sR", ts.scope_incremental)
      vim.keymap.set("x", "sd", ts.node_decremental)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter", branch = "main" },
    init = function()
      vim.g.no_plugin_maps = true
    end,
    opts = {},
  },
  { "RRethy/nvim-treesitter-endwise", cond = not vim.g.vscode },
}
