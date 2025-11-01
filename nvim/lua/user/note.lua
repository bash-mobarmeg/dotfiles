-- ╭──────────────────────────────────────────────────────────────╮
-- │ 🔍 Highlight Custom TODO / FIXME / NOTE Lines in Neovim      │
-- │ Highlights any line containing tags like:                    │
-- │   @TODO, @FIXME, @BUG, @NOTE, @HACK                          │
-- │ The entire line gets a background highlight.                 │
-- ╰──────────────────────────────────────────────────────────────╯

local ns = vim.api.nvim_create_namespace("todo_highlights")

vim.api.nvim_set_hl(0, "TodoHighlight",  { fg = "#000000", bg = MyColors.yellow, bold = true })
vim.api.nvim_set_hl(0, "FixmeHighlight", { fg = "#ffffff", bg = MyColors.warn, bold = true })
vim.api.nvim_set_hl(0, "NoteHighlight",  { fg = "#000000", bg = MyColors.green, bold = true })

local function highlight_todos()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  -- @NOTE
  for i, line in ipairs(lines) do
    local hl_group = nil

    if line:match("@TODO") then
      hl_group = "TodoHighlight"
    elseif line:match("@FIXME") or line:match("@BUG") then
      hl_group = "FixmeHighlight"
    elseif line:match("@NOTE") then
      hl_group = "NoteHighlight"
    end

    if hl_group then
      -- Use end_row to extend highlight to end of line
      vim.api.nvim_buf_set_extmark(buf, ns, i - 1, 0, {
        end_row = i - 1,
        end_col = #line,
        hl_group = hl_group,
        hl_eol = true,  -- This extends highlight to end of line!
      })
    end
  end
end

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged", "TextChangedI" }, {
  callback = highlight_todos,
})
