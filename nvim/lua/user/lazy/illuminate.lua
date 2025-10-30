return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  config = function()
    require("illuminate").configure({
      providers = { "lsp", "treesitter", "regex" },
      delay = 120, -- feel smoother and less distracting
      min_count_to_highlight = 2, -- avoid single accidental highlights
      under_cursor = false, -- skip the word under the cursor
      large_file_cutoff = 5000, -- disable in huge files
      large_file_overrides = { providers = { "lsp" } },
      filetypes_denylist = {
        "dirbuf",
        "dirvish",
        "fugitive",
        "NvimTree",
        "neo-tree",
        "TelescopePrompt",
        "help",
        "dashboard",
      },
    })

    -- 🪄 Optional keymaps for jumping between references
    local illuminate = require("illuminate")
    vim.keymap.set("n", "<a-n>", illuminate.goto_next_reference, { desc = "Next reference" })
    vim.keymap.set("n", "<a-p>", illuminate.goto_prev_reference, { desc = "Prev reference" })

    -- 🔦 Highlight group tweaks (match your colorscheme)
    vim.api.nvim_set_hl(0, "IlluminatedWordText",  { link = "CursorLine" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead",  { link = "CursorLine" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "CursorLine" })
  end,
}

