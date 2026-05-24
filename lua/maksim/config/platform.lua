local M = {}

M.is_windows = vim.fn.has("win32") == 1

function M.linux(val)
  return M.is_windows and nil or val
end

function M.windows(val)
  return M.is_windows and val or nil
end

return M
