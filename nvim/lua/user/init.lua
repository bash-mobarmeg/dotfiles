-- Load core modules

require("user.globals")
require("user.set")
require("user.remap")

require("user.lazy_init")
require("user.lazy")

require("user.emac_theme")
require("user.cursor")
require("user.tabs")

-- require("user.note") -- optional

-- ─────────────────────────────────────────────
-- 🧩  Utility
-- ─────────────────────────────────────────────
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local user_group = augroup("TheUser", {})
local yank_group = augroup("HighlightYank", {})

-- Reload helper
function R(name)
  require("plenary.reload").reload_module(name)
end

-- ─────────────────────────────────────────────
-- 🗂️  Filetype associations
-- ─────────────────────────────────────────────
vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

-- ─────────────────────────────────────────────
-- ✨  Autocommands
-- ─────────────────────────────────────────────

-- Highlight text on yank
autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

-- Remove trailing whitespace before save
autocmd("BufWritePre", {
  group = user_group,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Setup LSP keymaps dynamically
autocmd("LspAttach", {
  group = user_group,
  callback = function(e)
    local opts = { buffer = e.buf }
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    keymap("n", "<leader>vd", vim.diagnostic.open_float, opts)
    keymap("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    keymap("n", "<leader>vrr", vim.lsp.buf.references, opts)
    keymap("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    keymap("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    keymap("n", "[d", vim.diagnostic.goto_next, opts)
    keymap("n", "]d", vim.diagnostic.goto_prev, opts)
  end,
})

-- ─────────────────────────────────────────────
-- 🌐  Netrw (fallback file browser)
-- ─────────────────────────────────────────────
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

