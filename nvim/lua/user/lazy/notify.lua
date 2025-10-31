return {
  "rcarriga/nvim-notify",
  render = "default",
  stages = "slide",
  config = function ()
    local notify = require("notify")
    vim.notify = notify
  end
}
