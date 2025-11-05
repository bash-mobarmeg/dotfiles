-----------------------------------------------------------
-- 🌈 NeoVim Cool Theme (Refined & Structured)
-- Author: You
-- Style: Muted Warm + Cold Mix (Artisan Gray Aesthetic)
-----------------------------------------------------------

-- #dfdcbc , #eeecec
-- 🎨 Palette ------------------------------------------------
-- 🎨 Palette ------------------------------------------------
local colors = {
  yellow      = "#e2c774",  -- sunlit sand
  orange      = "#d89b6c",  -- amber coral
  blue        = "#6daedb",  -- soft sky blue
  blue_gray   = "#4a6a73",  -- deep sea slate
  red         = "#c9707d",  -- warm rose
  purple      = "#9a8fd0",  -- gentle violet
  green       = "#7bbf9b",  -- jade green
  cyan        = "#6ca6a3",  -- core cyan tone

  gray        = "#1f2527",  -- dark base
  light_gray  = "#3b4649",  -- UI neutral
  faint_gray  = "#283033",  -- subtle alt-bg
  dark_white  = "#8a9a9c",  -- soft desaturated white
  white       = "#c1d1cf",  -- seafoam white
  black       = "#151a1c",  -- deep oceanic black

  linenr      = "#3b4649",
  ui_text     = "#9ab5b6",
  ui_text_rev = "#151a1c",
  comment     = "#5a7071",
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
  ["@variable.parameter"]      = { fg = colors.ui_text },
  ["@variable.parameter.typescript"]      = { fg = colors.red },
  ["@property"]               = { fg = colors.ui_text },
  ["@field"]                  = { fg = colors.yellow },
  ["@lsp.mod.declaration.typescript"]  = { fg = colors.red },
  ["@lsp.mod.local.typescript"]  = { fg = colors.red },
  ["@lsp.typemod.variable.readonly.typescript"]  = { fg = colors.ui_text },
  ["@lsp.mod.readonly.typescript"]  = { fg = colors.ui_text },
  ["@lsp.type.function.typescript"] = { fg = colors.blue_gray },

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


