return {
  "declancm/cinnamon.nvim",
  version = "*",
  opts = {
    keymaps = {
      basic = false, -- Disable built-in mappings to avoid conflicts
      extra = false,
    },
    options = {
      mode = "cursor",
      delay = 5,
      step_size = {
        vertical = 1,
        horizontal = 2,
      },
      max_delta = {
        line = false,
        column = false,
        time = 1000,
      },
      callback = function()
        -- print("Scroll finished")
      end,
    },
  },
  keys = {
    -- Custom mappings
    { "<C-u>", '<cmd>lua require("cinnamon").scroll("15kzz")<cr>', mode = "n" },
    { "<C-y>", '<cmd>lua require("cinnamon").scroll("15jzz")<cr>', mode = "n" }, -- Scroll down 1 line
    { "<C-e>", '<cmd>lua require("cinnamon").scroll("1k")<cr>', mode = "n" }, -- Scroll up 1 line
    { "<C-d>", '<cmd>lua require("cinnamon").scroll("<C-d>zz")<cr>', mode = "n" },
    { "<C-b>", '<cmd>lua require("cinnamon").scroll("<C-b>zz")<cr>', mode = "n" },
    { "zt", '<cmd>lua require("cinnamon").scroll("zt")<cr>', mode = "n" },
    { "zz", '<cmd>lua require("cinnamon").scroll("zz")<cr>', mode = "n" },
    { "zb", '<cmd>lua require("cinnamon").scroll("zb")<cr>', mode = "n" },
  },
}

