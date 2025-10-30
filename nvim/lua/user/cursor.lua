-- lua/user/cursor.lua

-- ╭──────────────────────────────────────────────────────────────╮
-- │ ✨ Cursor Style & Color Configuration                        │
-- ╰──────────────────────────────────────────────────────────────╯

-- 🧭 Cursor shape per mode
vim.opt.guicursor = {
  "n-v-c:block-Cursor",    -- Normal, Visual, Command-line: block cursor
  "i:ver25-CursorInsert",  -- Insert mode: thin vertical bar
  "r:hor20-CursorReplace", -- Replace mode: short horizontal bar
}

vim.opt.cursorline = true

-- 🎨 Cursor highlight setup function
local function set_cursor_highlights()
  local cursor_colors = {
    Cursor        = { fg = "#000000", bg = "#54667d" },
    CursorInsert  = { fg = "#000000", bg = "#54667d" },
    CursorReplace = { fg = "#000000", bg = "#54667d" },
    CursorLine    = { bg = "#161616" },
    CursorLineNr  = { fg = "#b49b63", bg = "#161616" },
    CursorIcon    = { fg = "#b49b63", bg = "#161616" },
  }

  for group, style in pairs(cursor_colors) do
    vim.api.nvim_set_hl(0, group, style)
  end
end

-- Apply highlights immediately
set_cursor_highlights()

-- 🪄 Reapply whenever colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_cursor_highlights,
})

-- 🧭 Static cursor icon logic
vim.fn.sign_define("StaticCursor", { text = "»", texthl = "CursorIcon", numhl = "" })

local last_line = nil
local function update_icon()
  local bufnr = vim.api.nvim_get_current_buf()
  local line = vim.api.nvim_win_get_cursor(0)[1]

  -- Remove old sign
  if last_line ~= nil then
    pcall(vim.fn.sign_unplace, "static_cursor_group", { buffer = bufnr })
  end

  -- Place new sign
  vim.fn.sign_place(1, "static_cursor_group", "StaticCursor", bufnr, { lnum = line, priority = 20 })
  last_line = line
end

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { callback = update_icon })
update_icon()

