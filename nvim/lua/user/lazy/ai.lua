return {
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      local cmp = require("cmp")

      neocodeium.setup({
        filter = function(bufnr)
            if vim.endswith(vim.api.nvim_buf_get_name(bufnr), ".env") then
                return false
            end
            return true
        end
      })

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

