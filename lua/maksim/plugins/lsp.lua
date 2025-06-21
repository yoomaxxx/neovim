return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
      "b0o/schemastore.nvim",
    },
    cond = not vim.g.vscode,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "bashls",
          "ruff",
          "taplo",
          "jsonls",
          "yamlls",
          "dockerls",
          "jinja_lsp",
          "marksman",
          "ts_ls",
          "svelte",
          "vue_ls",
          "html",
          "cssls",
          "css_variables",
          "cssmodules_ls",
          "tailwindcss",
        },
      })

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
            == nil
      end

      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end

      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        formatting = {
          fields = { "abbr", "icon", "kind", "menu" },
          format = lspkind.cmp_format({
            show_labelDetails = true,
          }),
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
              feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              feedkey("<Plug>(vsnip-jump-prev)", "")
            end
          end, { "i", "s" }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          {
            name = "lazydev",
            group_index = 0,
          },
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("pyright", {
        capabilities = capabilities,
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              ignore = { "*" },
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      })

      vim.lsp.enable("ruff")

      vim.lsp.enable("taplo")

      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })

      vim.lsp.config("bashls", {
        filetypes = { "bash", "sh", "zsh" },
        capabilities = capabilities,
      })

      vim.lsp.enable("taplo")

      vim.lsp.config("dockerls", { capabilities = capabilities })

      vim.lsp.config("marksman", { capabilities = capabilities })

      vim.lsp.config("ts_ls", {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vim.fn.stdpath("data")
                .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
        capabilities = capabilities,
      })

      vim.lsp.enable("eslint")

      vim.lsp.enable("vue_ls")

      vim.lsp.config("html", {
        capabilities = capabilities,
        filetypes = { "htmldjango", "html" },
        init_options = {
          provideFormatter = false,
          embeddedLanguages = { css = true, javascript = true },
          configurationSection = { "html", "css", "javascript" },
        },
      })

      vim.lsp.config("cssls", {
        filetypes = { "css", "scss", "less" },
        init_options = { provideFormatter = true },
        settings = {
          css = { validate = false },
          scss = { validate = false },
          less = { validate = false },
        },
      })

      vim.lsp.config("jinja_lsp", { capabilities = capabilities })

      vim.lsp.config("djls", {
        cmd = { "djls", "serve" },
        filetypes = { "htmldjango", "html", "python" },
        root_markers = { "manage.py", "pyproject.toml", ".git" },
      })

      vim.lsp.config("tailwindcss", {
        settings = {
          tailwindCSS = {
            validate = true,
            lint = {
              cssConflict = "warning",
              invalidApply = "error",
              invalidScreen = "error",
              invalidVariant = "error",
              invalidConfigPath = "error",
              invalidTailwindDirective = "error",
              recommendedVariantOrder = "warning",
            },
            classAttributes = {
              "class",
              "className",
              "class:list",
              "classList",
              "ngClass",
            },
            includeLanguages = {
              eelixir = "html-eex",
              elixir = "phoenix-heex",
              eruby = "erb",
              heex = "phoenix-heex",
              htmlangular = "html",
              templ = "html",
            },
          },
        },
      })

      vim.lsp.config("stylelint_lsp", {
        settings = {
          stylelintplus = {
            -- see available options in stylelint-lsp documentation
          },
        },
      })

      vim.lsp.enable("cssmodules_ls")
      vim.lsp.enable("css_variables")
    end,
  },
}
