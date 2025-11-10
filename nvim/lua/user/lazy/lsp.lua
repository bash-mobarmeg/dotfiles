return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    -- require('lspconfig').clangd.setup({
    --   cmd = {"clangd", "--compile-commands-dir=build"},
    -- })


    mason.setup()
    mason_lspconfig.setup({

      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "rust_analyzer"
      },

      handlers = {
        function(server_name) -- default handler (optional)
          lspconfig[server_name].setup {
            capabilities = capabilities
          }
        end,

        ["lua_ls"] = function()
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,

        ["ts_ls"] = function()
          lspconfig.ts_ls.setup({
            capabilities = capabilities,
            on_attach = function(client)
              -- Turn off tsserver formatting, so Prettier takes over
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end,
          })
        end,

        -- ["rust_analyzer"] = function()
        --   lspconfig.rust_analyzer.setup({
        --     capabilities = capabilities,
        --     settings = {
        --       ["rust-analyzer"] = {
        --         rustfmt = {
        --           extraArgs = { "+nightly" }, -- optional, if you want nightly rustfmt
        --         },
        --       },
        --     },
        --     on_attach = function(client, bufnr)
        --       -- Enable formatting for rust-analyzer
        --       client.server_capabilities.documentFormattingProvider = true
        --
        --       -- Optional: add keymap for formatting
        --       vim.keymap.set("n", "<leader>lf", function()
        --         vim.lsp.buf.format({ async = true })
        --       end, { desc = "Format Rust with rust-analyzer", buffer = bufnr })
        --     end,
        --   })
        -- end,

      }
    })

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      update_in_insert = true,
      underline = true,
      severity_sort = false,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    })

    vim.filetype.add({
      extension = {
        fs = "glsl",
        vs = "glsl",
        frag = "glsl",
        vert = "glsl",
      },
    })

  end
}
