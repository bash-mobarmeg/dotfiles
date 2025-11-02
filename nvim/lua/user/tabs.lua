-----------------------------------------------------------
-- 🧭  Custom Tabline — Elegant & Minimal (with Colored Modified Icon)
-- Author: You
-- Style: Subtle Blue Glow + Clean Icons
-----------------------------------------------------------

-----------------------------------------------------------
-- 🗂️ TAB MANAGEMENT
-----------------------------------------------------------
-- Alt + [1–9] → Jump to specific tab
for i = 1, 9 do
  vim.keymap.set("n", "<M-" .. i .. ">", function()
    local tabs = vim.api.nvim_list_tabpages()
    if i <= #tabs then
      vim.cmd(i .. "tabnext")
    else
      vim.notify("Tab " .. i .. " does not exist", vim.log.levels.WARN)
    end
  end, { desc = "Go to tab " .. i })
end


local autocmd = vim.api.nvim_create_autocmd

-- Apply highlights immediately
-- set_cursor_highlights()
-- your existing autocmd
local function apply_tab_highlights()
    vim.api.nvim_set_hl(0, "SignColumn",      { bg = MyColors.primary })
    vim.api.nvim_set_hl(0, "FoldColumn",      { bg = MyColors.secondary, fg = "#89b4fa" })

    vim.api.nvim_set_hl(0, "TabLine",         { bg = MyColors.secondary, fg = "#a0a0a0" })
    vim.api.nvim_set_hl(0, "TabLineSel",      { bg = MyColors.secondary, fg = "#c4a463" })
    vim.api.nvim_set_hl(0, "TabLineFill",     { bg = MyColors.secondary, fg = "#a0a0a0" })
    vim.api.nvim_set_hl(0, "TabLineModified", { bg = MyColors.secondary, fg = "#e46876", bold = true })
end

apply_tab_highlights()

autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_tab_highlights,
})


-----------------------------------------------------------
-- 💡  Custom Tab Rendering Function
-----------------------------------------------------------
function _G.MyTabLine()
  local s = ""
  local total_tabs = vim.fn.tabpagenr("$")
  local current_tab = vim.fn.tabpagenr()

  for i = 1, total_tabs do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    local filename = vim.fn.fnamemodify(bufname, ":t")
    if filename == "" then filename = "[No Name]" end

    local is_modified = vim.fn.getbufvar(bufnr, "&modified") == 1
    local modified_icon = "⥁"
    local unmodified_icon = "▢"
    local unmodified_selected_icon = "🞆"

    local icon = is_modified and modified_icon or unmodified_icon
    local selected_icon = is_modified and modified_icon or unmodified_selected_icon

    if i == current_tab then
      s = s .. "%#TabLineSel# "      -- start selected tab highlight
      if is_modified then
        s = s .. "%#TabLineModified#" .. selected_icon .. "%#TabLineSel#"  -- red icon only
      else
        s = s .. selected_icon
      end
      s = s .. " " .. filename .. " "
    else
      s = s .. "%#TabLine# "         -- start normal tab highlight
      if is_modified then
        s = s .. "%#TabLineModified#" .. icon .. "%#TabLine#"  -- red icon only
      else
        s = s .. icon
      end
      s = s .. " " .. filename .. " "
    end
  end

  return s .. "%#TabLineFill#"
end


-----------------------------------------------------------
-- ✅  Notes
-- ▢  ▩  ⛶  inactive tab symbol
-- ⛶ inactive tab symbol
-- ▫ active tab symbol
-- ◌ modified indicator (colored)
-- You can swap with any Nerd Font glyph you like:
-- 󱎕    ▢  ⎚ ▣    ☃  ✦  ✧  ⬡    ◇  ◈
-- Change `#e46876` above for your preferred accent:
--   🔵 #89b4fa   🟢 #a6e3a1   🟠 #f9e2af   🔴 #e46876
-----------------------------------------------------------
