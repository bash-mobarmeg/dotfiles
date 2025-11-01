return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },

  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  {
    -- Color picker
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup()
    end
  },

  {
  "oysandvik94/curl.nvim",
  cmd = { "CurlOpen" },
  config = function()
    local curl = require("curl")
    curl.setup({})

    vim.keymap.set("n", "<leader>cc", function()
      curl.open_curl_tab()
    end, { desc = "Open a curl tab scoped to the current working directory" })

    vim.keymap.set("n", "<leader>co", function()
      curl.open_global_tab()
    end, { desc = "Open a curl tab with gloabl scope" })

    -- These commands will prompt you for a name for your collection
    vim.keymap.set("n", "<leader>csc", function()
      curl.create_scoped_collection()
    end, { desc = "Create or open a collection with a name from user input" })

    vim.keymap.set("n", "<leader>cgc", function()
      curl.create_global_collection()
    end, { desc = "Create or open a global collection with a name from user input" })

    -- vim.keymap.set("n", "<leader>fsc", function()
    --   curl.pick_scoped_collection()
    -- end, { desc = "Choose a scoped collection and open it" })
    --
    -- vim.keymap.set("n", "<leader>fgc", function()
    --   curl.pick_global_collection()
    -- end, { desc = "Choose a global collection and open it" })
  end,
}
}
