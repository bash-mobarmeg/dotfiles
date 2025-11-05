return {
  "nvimtools/none-ls.nvim",
  dependencies = { "mason.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Rust formatter
        -- null_ls.builtins.formatting.rustfmt,  -- Use rustfmt for Rust

        -- OR use this if you don’t use prettierd:
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.fish,
        -- null_ls.builtins.diagnostics.eslint_d.with({
        --   diagnostics_format = '[eslint] #{m}\n(#{c})'
        -- }),
      },
    })
  end,
}

