return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependecies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "regex",
          "lua",
          "gitignore",
          "json",
          "toml",
          "yaml",
          "python",
          "javascript",
          "typescript",
          "tsx"
        },
        textsubjects = {
          prev_selection = ',',
          keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
          },
        },
        indent = {
          enable = true,
        },
        highlight = {
          enable = true,
        },
        endwise = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["as"] = "@block.outer",
              ["is"] = "@block.inner",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<space>p"] = "@parameter.inner",
              ["<space>b"] = "@block.outer",
              ["<space>a"] = "@class.outer",
              ["<space>M"] = "@function.outer",
            },
            swap_previous = {
              ["<space>P"] = "@parameter.inner",
              ["<space>B"] = "@block.outer",
              ["<space>A"] = "@class.outer",
              ["<space>m"] = "@function.outer",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          }
        },
      })
    end,
  },
}
