local M = {}

M.is_windows = vim.fn.has("win32") == 1

function M.linux(val)
  return M.is_windows and nil or val
end

return M
