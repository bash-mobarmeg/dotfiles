return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local cmp = require('cmp')
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

    -- vim.lsp.config('rust_analyzer', {
    --   -- Server-specific settings. See `:help lsp-quickstart`
    --   settings = {
    --     ['rust-analyzer'] = {},
    --   },
    -- })

    mason.setup()
    mason_lspconfig.setup({

      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "rust_analyzer",
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

        ["rust_analyzer"] = function()
          lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            on_attach = function(client)
            end,
          })
        end,
      }
    })

    -- local cmp_select = { behavior = cmp.SelectBehavior.Select }
    --
    -- cmp.setup({
    --   snippet = {
    --     expand = function(args)
    --       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --     end,
    --   },
    --
    --   completion = {
    --     completeopt = "menu,menuone,preview,noselect"
    --   },
    --
    --   mapping = cmp.mapping.preset.insert({
    --     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    --     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    --     ['<CR>'] = cmp.mapping.confirm({ select = true }),
    --     ["<C-Space>"] = cmp.mapping.complete(),
    --   }),
    --
    --   sources = cmp.config.sources(
    --     {
    --       { name = 'nvim_lsp' },
    --       { name = 'luasnip' }, -- For luasnip users.
    --     },
    --     {
    --       { name = 'buffer' },
    --     }
    --   )
    -- })

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

    vim.api.nvim_set_hl(0, "FidgetNormal", { bg = "#1e1e2e", fg = "#cdd6f4" }) -- Background and text color
  end
}
