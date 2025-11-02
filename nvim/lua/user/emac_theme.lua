-----------------------------------------------------------
-- 🌈 NeoVim Cool Theme (Refined & Structured)
-- Author: You
-- Style: Muted Warm + Cold Mix (Artisan Gray Aesthetic)
-----------------------------------------------------------

-- #dfdcbc , #eeecec
-- 🎨 Palette ------------------------------------------------
local colors = {
  yellow      = "#a08c59", -- #d9bb54
  orange      = "#9e7c59",
  blue        = "#5f8fc1",
  blue_gray   = "#4b5b70",
  red         = "#b35e64",
  purple      = "#975faf",
  green       = "#86a76d",
  cyan        = "#5c959e",

  gray        = "#272b33",
  light_gray  = "#4d525d",
  faint_gray  = "#31353c",
  dark_white  = "#6e7973",
  white       = "#9d9d9d",
  black       = "#21242a",

  linenr      = "#4d525d",
  ui_text     = "#8b8b8b",
  ui_text_rev = "#21242a",
  comment     = "#614a2e",
}


-----------------------------------------------------------
-- 🪄 Highlight Groups
-----------------------------------------------------------
local highlights = {

  -- 🧱 Base UI
  ["Normal"]         = { bg = "none", fg = colors.white },
  ["NormalFloat"]    = { bg = "none", fg = colors.white },
  ["NonText"]        = { fg = "#2a2a2a" },

  ["LineNr"]         = { fg = colors.yellow,     bg = MyColors.secondary, bold = true },
  ["LineNrAbove"]    = { fg = colors.dark_white, bg = MyColors.primary },
  ["LineNrBelow"]    = { fg = colors.dark_white, bg = MyColors.primary },

  ["FloatBorder"]    = { bg = "none", fg = colors.blue_gray },
  ["Visual"]         = { bg = colors.dark_white, fg = colors.black },

  -- ⚠️ Messages
  ["ErrorMsg"]       = { fg = colors.red },
  ["WarningMsg"]     = { fg = colors.orange },
  ["InfoMsg"]        = { fg = colors.yellow },

  ["NotifyBackground"]   = { bg = MyColors.secondary },

  ---------------------------------------------------------
  -- 💬 Syntax Groups
  ---------------------------------------------------------
  ["comment"]        = { fg = colors.comment, italic = false },

  -- Constants
  ["constant"]                = { fg = colors.yellow },
  ["@constant"]               = { fg = colors.yellow },
  ["@constant.builtin"]       = { fg = colors.yellow },
  ["@constant.numeric"]       = { fg = colors.white },
  ["@constant.character"]     = { fg = colors.yellow },
  ["@constant.builtin.boolean"] = { fg = colors.yellow },

  -- Functions
  ["function"]                = { fg = colors.white },
  ["@function"]               = { fg = colors.white },
  ["function.call"]           = { fg = colors.white },
  ["@function.call"]          = { fg = colors.white },
  ["@lsp.mod.readonly.typescript"]  = { fg = colors.white },
  ["@lsp.type.function.typescript"] = { fg = colors.blue_gray },
  ["@function.builtin"]       = { fg = colors.white },
  ["@function.macro"]         = { fg = colors.white },
  ["rustFuncCall"]            = { fg = colors.blue_gray },

  -- Keywords
  ["keyword"]                 = { fg = colors.yellow },
  ["@keyword"]                = { fg = colors.yellow },
  ["@keyword.operator.typescript"] = { fg = colors.yellow },

  -- Strings
  ["string"]                  = { fg = colors.green },
  ["@string.escape"]          = { fg = colors.white },
  ["@string.special"]         = { fg = colors.green },

  -- Types
  ["type"]                    = { fg = colors.dark_white },
  ["@type"]                   = { fg = colors.yellow },

  -- Variables & Fields
  ["@variable"]               = { fg = colors.ui_text },
  ["@variable.typescript"]    = { fg = colors.ui_text },
  ["@variable.member"]        = { fg = colors.ui_text },
  ["@variable.member.typescript"] = { fg = colors.red },
  ["variable.builtin"]        = { fg = colors.ui_text },
  ["@variable.parameter"]      = { fg = colors.red },
  ["@variable.parameter.typescript"]      = { fg = colors.red },
  ["@property"]               = { fg = colors.ui_text },
  ["@field"]                  = { fg = colors.yellow },

  -- Operators & Punctuation
  ["operator"]                = { fg = colors.ui_text },
  ["punctuation"]             = { fg = colors.ui_text },
  ["@punctuation.special"]    = { fg = colors.green },

  -- Misc
  ["@enum"]                   = { fg = colors.orange },
  ["constructor"]             = { fg = colors.blue },
  ["special"]                 = { fg = colors.ui_text },

  ---------------------------------------------------------
  -- 🧬 Markup & Docs
  ---------------------------------------------------------
  ["markup.heading"]           = { fg = colors.gray },
  ["markup.raw.inline"]        = { fg = colors.green },
  ["markup.bold"]              = { fg = colors.yellow, modifiers = { "bold" } },
  ["markup.italic"]            = { fg = colors.purple, modifiers = { "italic" } },
  ["markup.strikethrough"]     = { modifiers = { "crossed_out" } },
  ["markup.list"]              = { fg = colors.gray },
  ["markup.quote"]             = { fg = colors.yellow },
  ["markup.link.url"]          = { fg = colors.cyan, modifiers = { "underlined" } },
  ["markup.link.text"]         = { fg = colors.purple },

  ---------------------------------------------------------
  -- 🔁 Diff & Diagnostics
  ---------------------------------------------------------
  ["diff.plus"]                = { fg = colors.green },
  ["diff.delta"]               = { fg = colors.yellow },
  ["diff.minus"]               = { fg = colors.gray },

  ["info"]                     = { fg = colors.green, modifiers = { "bold" } },
  ["hint"]                     = { fg = colors.blue, modifiers = { "bold" } },
  ["warning"]                  = { fg = colors.yellow, modifiers = { "bold" } },
  ["error"]                    = { fg = colors.red, modifiers = { "bold" } },

  ---------------------------------------------------------
  -- 🖥️ UI Elements
  ---------------------------------------------------------
  ["ui.background"]            = { bg = colors.ui_text_rev },
  ["ui.gutter"]                = { bg = colors.gray },
  ["ui.virtual"]               = { fg = colors.faint_gray },
  ["ui.virtual.indent-guide"]  = { fg = colors.faint_gray },
  ["ui.virtual.whitespace"]    = { fg = colors.light_gray },
  ["ui.virtual.ruler"]         = { bg = colors.gray },
  ["ui.virtual.inlay-hint"]    = { fg = colors.blue_gray, modifiers = { "bold" } },

  -- Cursor / Selection
  ["ui.cursor"]                = { fg = colors.white, modifiers = { "reversed" } },
  ["ui.cursor.primary"]        = { fg = colors.white, modifiers = { "reversed" } },
  ["ui.cursor.match"]          = { fg = colors.blue, modifiers = { "underlined" } },
  ["ui.selection"]             = { bg = colors.faint_gray },
  ["ui.selection.primary"]     = { bg = "#293B5B" },
  ["ui.cursorline.primary"]    = { bg = colors.gray,  },

  -- Highlight
  ["ui.highlight"]             = { bg = colors.gray },
  ["ui.highlight.frameline"]   = { bg = "#97202A" },

  -- Line Numbers
  ["ui.linenr"]                = { fg = colors.linenr },
  ["ui.linenr.selected"]       = { fg = colors.ui_text },

  -- Statusline
  ["ui.statusline"]            = { fg = colors.white, bg = colors.gray },
  ["ui.statusline.inactive"]   = { fg = colors.light_gray, bg = colors.black },
  ["ui.statusline.normal"]     = { fg = colors.black, bg = colors.blue },
  ["ui.statusline.insert"]     = { fg = colors.black, bg = colors.green },
  ["ui.statusline.select"]     = { fg = colors.black, bg = colors.purple },

  -- Text
  ["ui.text"]                  = { fg = colors.ui_text },
  ["ui.text.focus"]            = { fg = "#C8CCD4", bg = "#2F343E", modifiers = { "bold" } },

  -- Popups / Menus
  ["ui.help"]                  = { fg = colors.white, bg = colors.gray },
  ["ui.popup"]                 = { bg = colors.gray },
  ["ui.window"]                = { fg = colors.gray },
  ["ui.menu"]                  = { fg = colors.ui_text, bg = colors.gray },
  ["ui.menu.selected"]         = { fg = colors.ui_text_rev, bg = colors.blue },
  ["ui.menu.scroll"]           = { fg = colors.ui_text, bg = colors.light_gray },

  -- Notes
  ["NoteInner"]                = { fg = colors.yellow, modifiers = { "bold" } },
  ["NoteInnerText"]            = { fg = colors.yellow, modifiers = { "bold" } },
}

-----------------------------------------------------------
-- ⚙️ Apply Highlights
-----------------------------------------------------------
local function apply_theme()
  for group, opts in pairs(highlights) do
    local hl = {}

    hl.fg = opts.fg
    hl.bg = opts.bg
    hl.bold = opts.bold
    hl.italic = opts.italic
    hl.underline = opts.underline

    if opts.modifiers then
      for _, mod in ipairs(opts.modifiers) do
        if mod == "bold"         then hl.bold = true end
        if mod == "italic"       then hl.italic = true end
        if mod == "underlined"   then hl.underline = true end
        if mod == "crossed_out"  then hl.strikethrough = true end
        if mod == "reversed"     then hl.reverse = true end
        if mod == "dim"          then hl.standout = true end
      end
    end

    vim.api.nvim_set_hl(0, group, hl)
  end
end

local ok, _ = pcall(vim.cmd, "colorscheme lackluster-dark")
if not ok then
  vim.notify("Colorscheme 'lackluster-dark' not found! Using default.", vim.log.levels.WARN)
end

apply_theme()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_theme,
})


