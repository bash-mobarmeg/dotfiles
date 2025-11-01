return {
  "nvimtools/none-ls.nvim",
  dependencies = { "mason.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Prettier formatter
        null_ls.builtins.formatting.prettierd, -- faster (via daemon)
        -- OR use this if you don’t use prettierd:
        -- null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.diagnostics.eslint_d.with({
        --   diagnostics_format = '[eslint] #{m}\n(#{c})'
        -- }),
        -- null_ls.builtins.diagnostics.fish,
      },
    })
  end,
}

