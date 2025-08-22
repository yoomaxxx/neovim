return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          opts = {
            completion_provider = "cmp",
            goto_file_action = "tabnew",
          },
          tools = {
            opts = {
              auto_submit_errors = true,
              auto_submit_success = true,
            },
            ["grep_search"] = {
              enabled = function()
                return vim.fn.executable("rg") == 1
              end,
            },
            ["cmd_runner"] = {
              opts = {
                requires_approval = false,
              },
            },
          },
          adapter = "ollama",
          keymaps = {
            send = {
              modes = { n = "<C-s>", i = "<C-s>" },
              opts = {},
            },
            close = {
              modes = { n = "<C-c>", i = "<C-c>" },
              opts = {},
            },
          },
        },
        variables = {
          ["buffer"] = {
            opts = {
              default_params = "pin",
            },
          },
        },
        slash_commands = {
          ["file"] = {
            callback = "strategies.chat.slash_commands.file",
            description = "Select a file using Telescope",
            opts = {
              provider = "telescope",
              contains_code = true,
            },
          },
          ["buffer"] = {
            keymaps = {
              modes = {
                i = "<C-b>",
                n = { "<C-b>", "gb" },
              },
            },
          },
        },
        inline = {
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "gr" },
              opts = { nowait = true },
              description = "Reject the suggested change",
            },
          },
          adapter = "ollama",
        },
        cmd = { adapter = "ollama" },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      opts = {
        log_level = "ERROR", -- or "TRACE"
        opts = {
          language = "Russian",
        },
      },
    })
  end,
}
