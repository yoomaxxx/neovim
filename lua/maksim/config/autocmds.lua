-- Comments

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- Conform

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Ruff

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = "LSP: Disable hover capability from Ruff",
})

-- Lint

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Dap

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "dap-view", "dap-view-term", "dap-repl" },
  callback = function(args)
    vim.keymap.set("n", "q", "<C-w>q", { buffer = args.buf })
  end,
})

-- Django

-- Detect Django projects
local function is_django_project(path)
  local current = path
  while current ~= "/" do
    -- Check for manage.py
    if vim.fn.filereadable(current .. "/manage.py") == 1 then
      return true
    end

    -- Check for pyproject.toml with django dependency
    -- Note: This is a naive check that just searches for "django" in the file.
    -- A more robust approach would parse the TOML and check dependencies properly.
    local pyproject = current .. "/pyproject.toml"
    if vim.fn.filereadable(pyproject) == 1 then
      local content = vim.fn.readfile(pyproject)
      for _, line in ipairs(content) do
        if line:match("django") then
          return true
        end
      end
    end

    current = vim.fn.fnamemodify(current, ":h")
  end
  return false
end

-- Auto-detect htmldjango filetype for Django projects
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.html",
  callback = function(args)
    local file_dir = vim.fn.fnamemodify(args.file, ":p:h")
    if is_django_project(file_dir) then
      vim.bo[args.buf].filetype = "htmldjango"
    end
  end,
})
