return {
  -- √ 󰞁 ¶
  {
    "preservim/tagbar"
  },

  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    window = {
      width = 120, -- width of the Zen window
      height = 1, -- height of the Zen window
    },
    keys = { { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
    keys = {},
  },

  {
    "rcarriga/nvim-notify",
    config = function ()
      require("notify").setup({
        -- Time before notification closes
        timeout = 2000,

        -- Maximum width of the notification window
        max_width = function()
          return math.floor(vim.o.columns * 0.5) -- 50% of screen width
        end,

        -- Where notifications appear
        top_down = false,  -- bottom to top

        -- Optional: Render stages ("slide", "fade_in_slide_out", "static")
        stages = "slide",

        -- Optional: border style
        border = "rounded",

        -- Optional: minimum width
        minimum_width = 20,
      })
    end
  },

  {
    -- <leader>k for fingind words
    "hadronized/hop.nvim",
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require('hop').setup({
        keys = 'etovxqpdygfblzhckisuran'
      });
    end
  },

  {
    "j-hui/fidget.nvim",
    config = function ()
      local fidget = require("fidget")

      fidget.setup({
        notification = {
          window = {
            winblend = 0,               -- fully opaque
            border = "rounded",
            normal_hl = "FidgetNormal", -- highlight group for background
          },
        },
      })


      vim.api.nvim_set_hl(0, "FidgetNormal", { bg = MyColors.secondary })
    end
  },

  {
    "saecki/live-rename.nvim",
    config = function ()
      local live_rename = require("live-rename")

      -- The following are equivalent
      vim.keymap.set("n", "<leader>R", live_rename.rename,  { desc = "LSP rename" })
      vim.keymap.set("n", "<leader>R", live_rename.map(),   { desc = "LSP rename" })
      vim.keymap.set("n", "<leader>R", live_rename.map({}), { desc = "LSP rename" })

      -- The following are equivalent
      vim.keymap.set("n", "<leader>r", live_rename.map({ text = "", insert = true }), { desc = "LSP rename" })
      vim.keymap.set("n", "<leader>r", function() live_rename.rename({ text = "", insert = true }) end, { desc = "LSP rename" })
    end
  },

  {
    "utilyre/barbecue.nvim", -- VSCode like winbar
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      theme = 'nordic',
    },
    config = function()
      require("barbecue").setup({
        theme = {
            normal = { bg = "#101010" },
        },
      })
    end
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach", -- Trigger when LSP attaches
    priority = 1000,
    config = function()
      local tiny_diag = require("tiny-inline-diagnostic")

      tiny_diag.setup({
        preset = "modern", -- Try "minimal", "classic", or "modern"
        signs = {
          left = "▎",          -- Left bar
          right = "",          -- Right side empty
          diag = " ",         -- Main icon
          arrow = "  ",       -- Nice arrow
          up_arrow = "  ",    -- For multiline hints
          vertical = " │",
          vertical_end = " ╰",
        },
        blend = {
          factor = 0.25,  -- Transparency
          background = true, -- Blend with background
        },
        -- Per-severity customization (optional)
        severity = {
          [vim.diagnostic.severity.ERROR] = {
            sign = " ",
            hl = "DiagnosticError",
          },
          [vim.diagnostic.severity.WARN] = {
            sign = " ",
            hl = "DiagnosticWarn",
          },
          [vim.diagnostic.severity.INFO] = {
            sign = " ",
            hl = "DiagnosticInfo",
          },
          [vim.diagnostic.severity.HINT] = {
            sign = " ",
            hl = "DiagnosticHint",
          },
        },
        -- Add padding or offset
        window = {
          padding = 2,
          margin = 1,
          border = "rounded", -- “none”, “rounded”, “single”
        },
      })

      vim.cmd [[
        highlight! link TinyInlineDiagnosticNormal Normal
        highlight! link TinyInlineDiagnosticError DiagnosticError
        highlight! link TinyInlineDiagnosticWarn DiagnosticWarn
        highlight! link TinyInlineDiagnosticHint DiagnosticHint
      ]]

      tiny_diag.enable()
    end,
  },

  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({
        icons = true,
        auto_open = false,
        auto_close = false,
        use_diagnostic_signs = true,
        modes = {
          symbols = { -- this mode uses ctags
            enable = false,
          },
        },
      })

      vim.keymap.set("n", "<leader>tt", function()
        require("trouble").toggle()
      end)

      vim.keymap.set("n", "[t", function()
        require("trouble").next({ skip_groups = true, jump = true })
      end)

      vim.keymap.set("n", "]t", function()
        require("trouble").previous({ skip_groups = true, jump = true })
      end)

      --    
      vim.fn.sign_define('DiagnosticSignError', { text = '┃', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = '┃', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = '┃', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '┃', texthl = 'DiagnosticSignHint' })

      local colors = {
        error = "#b7476f",
        warn  = "#b08963",
        info  = "#6b9fd7",
        hint  = "#95b879",
      }

      vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = colors.error })
      vim.api.nvim_set_hl(0, "DiagnosticSignWarn",  { fg = colors.warn })
      vim.api.nvim_set_hl(0, "DiagnosticSignInfo",  { fg = colors.info })
      vim.api.nvim_set_hl(0, "DiagnosticSignHint",  { fg = colors.hint })
    end
  },
}

