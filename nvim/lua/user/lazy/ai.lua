return {
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      local cmp = require("cmp")

      neocodeium.setup()

      cmp.event:on("menu_opened", function()
        -- vim.defer_fn(function()
        --   neocodeium.clear()
        -- end, 2000)
      end)

      neocodeium.setup({
        filter = function()
          return not cmp.visible()
        end,
      })

      -- Keymap to accept NeoCodeium suggestion
      vim.keymap.set("i", "<A-f>", function()
        neocodeium.accept()
      end, { desc = "Accept NeoCodeium suggestion" })
    end,
  },
}

