-- treesitter-textobjects

local swap = require("nvim-treesitter-textobjects.swap")

-- Selects

local select = require("nvim-treesitter-textobjects.select")

vim.keymap.set({ "x", "o" }, "af", function()
  select.select_textobject("@function.outer", "textobjects")
end, { silent = true })

vim.keymap.set({ "x", "o" }, "if", function()
  select.select_textobject("@function.inner", "textobjects")
end, { silent = true })

vim.keymap.set({ "x", "o" }, "ac", function()
  select.select_textobject("@class.outer", "textobjects")
end, { silent = true })

vim.keymap.set({ "x", "o" }, "ic", function()
  select.select_textobject("@class.inner", "textobjects")
end, { silent = true })

vim.keymap.set({ "x", "o" }, "as", function()
  select.select_textobject("@block.outer", "textobjects")
end, { silent = true })

vim.keymap.set({ "x", "o" }, "is", function()
  select.select_textobject("@block.inner", "textobjects")
end, { silent = true })

-- Swaps

vim.keymap.set("n", "<leader>c", function()
  swap.swap_next("@parameter.inner")
end)

vim.keymap.set("n", "<leader>C", function()
  swap.swap_previous("@parameter.outer")
end)

vim.keymap.set("n", "<leader>s", function()
  swap.swap_next("@block.outer")
end)

vim.keymap.set("n", "<leader>S", function()
  swap.swap_previous("@block.outer")
end)

vim.keymap.set("n", "<leader>o", function()
  swap.swap_next("@class.outer")
end)

vim.keymap.set("n", "<leader>O", function()
  swap.swap_previous("@class.outer")
end)

vim.keymap.set("n", "<leader>p", function()
  swap.swap_next("@function.inner")
end)

vim.keymap.set("n", "<leader>P", function()
  swap.swap_previous("@function.outer")
end)

-- Moves

local move = require("nvim-treesitter-textobjects.move")

vim.keymap.set({ "n", "x", "o" }, "]m", function()
  move.goto_next_start("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]]", function()
  move.goto_next_start("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]M", function()
  move.goto_next_end("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "][", function()
  move.goto_next_end("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[m", function()
  move.goto_previous_start("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[[", function()
  move.goto_previous_start("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[M", function()
  move.goto_previous_end("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[]", function()
  move.goto_previous_end("@class.outer", "textobjects")
end)

-- Go to either the start or the end, whichever is closer.
-- Use if you want more granular movements
vim.keymap.set({ "n", "x", "o" }, "]d", function()
  move.goto_next("@conditional.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[d", function()
  move.goto_previous("@conditional.outer", "textobjects")
end)

local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
