return {
  "folke/noice.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    -- vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE", fg = "#cdd6f4" })
    -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#89b4fa" })

    require("noice").setup({
      cmdline = {
        view = "cmdline_popup", -- floating popup
      },
      messages = {
        view = "mini", -- optional: minimal inline messages
      },
      presets = {
        bottom_search = true,
        command_palette = true,
      },
    })
  end,
}

