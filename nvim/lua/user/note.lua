-- ╭──────────────────────────────────────────────────────────────╮
-- │ 🔍 Highlight Custom Notes & Warnings in Comments             │
-- │ Matches patterns like:                                       │
-- │   >> [[ Some note ]]                                         │
-- │   ^  Regular note                                            │
-- │   ^! Important warning                                       │
-- ╰──────────────────────────────────────────────────────────────╯

local events = { "BufEnter", "TextChanged", "TextChangedI", "InsertLeave" }

vim.api.nvim_create_autocmd(events, {
  callback = function()
    -- Clear existing matches
    vim.fn.clearmatches()

    -- 🗒️  Highlight patterns
    vim.fn.matchadd("NoteHighlight", [[\v\[\[.{-}\]\]], 100)
    vim.fn.matchadd("NoteHighlight", [[\v\^ .{-}$]], 100)
    vim.fn.matchadd("WarnHighlight", [[\v\^! .{-}$]], 100)

    -- 🎨 Define highlight groups (reapplied every time)
    vim.api.nvim_set_hl(0, "NoteHighlight", {
      fg = "#9BCDCD",
      bg = "#304242", -- alt: #A1C181 / #debb7e
      bold = true,
      italic = false,
    })

    vim.api.nvim_set_hl(0, "WarnHighlight", {
      fg = "#ffffff",
      bg = "#d92525",
      bold = true,
      italic = false,
    })
  end,
})

