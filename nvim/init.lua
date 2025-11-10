
require("user")

-- Startup actions
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if _G.startup_check_notes then
      _G.startup_check_notes()
    end
  end,
})

