return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },
  {
    -- Color picker
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup()
    end
  }
}
