return {
  "xiyaowong/transparent.nvim",
  config = function()
    local transparent = require("transparent")
    transparent.setup({
      auto = true,
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
      },
      exclude_groups = {
        "DiagnosticSignError",
        "DiagnosticSignWarn",
        "DiagnosticSignInfo",
        "DiagnosticSignHint"
      },
    })
  end,
}
