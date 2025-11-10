return {
  -- √ 󰞁 ¶
  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>tt", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
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
          return math.floor(vim.o.columns * 0.7) -- 50% of screen width
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
            border = "none", -- rounded
            normal_hl = "FidgetNormal", -- highlight group for background
            max_width = 50,             -- maximum width of the Fidget window
          },
        },
      })

      vim.api.nvim_set_hl(0, "FidgetNormal", { bg = MyColors.primary, fg = MyColors.fg }) -- Background and text color
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
            normal = { bg = MyColors.primary },
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
          factor = 0.20,  -- Transparency
          background = false, -- Blend with background
        },

        -- Per-severity customization (optional)
        severity = {
          [vim.diagnostic.severity.ERROR] = { sign = " ", hl = "DiagnosticError" },
          [vim.diagnostic.severity.WARN]  = { sign = " ", hl = "DiagnosticWarn" },
          [vim.diagnostic.severity.INFO]  = { sign = " ", hl = "DiagnosticInfo" },
          [vim.diagnostic.severity.HINT]  = { sign = " ", hl = "DiagnosticHint" },
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

      vim.api.nvim_set_hl(0, "DiagnosticError", { fg = MyColors.warn })
      vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = MyColors.yellow })
      vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = MyColors.gold })
      vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = MyColors.hint })

      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = MyColors.warn,   bg = MyColors.secondary })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { fg = MyColors.gold,   bg = MyColors.secondary })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo",  { fg = MyColors.yellow, bg = MyColors.secondary })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",  { fg = MyColors.hint,   bg = MyColors.secondary })


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

      -- vim.keymap.set("n", "<leader>tt", function()
      --   require("trouble").toggle()
      -- end)

      vim.keymap.set("n", "[t", function()
        require("trouble").next({ skip_groups = true, jump = true })
      end)

      vim.keymap.set("n", "]t", function()
        require("trouble").previous({ skip_groups = true, jump = true })
      end)

      --    
      vim.fn.sign_define('DiagnosticSignError', { text = '┃', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn',  { text = '┃', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo',  { text = '┃', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint',  { text = '┃', texthl = 'DiagnosticSignHint' })

      vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = MyColors.warn })
      vim.api.nvim_set_hl(0, "DiagnosticSignWarn",  { fg = MyColors.yellow })
      vim.api.nvim_set_hl(0, "DiagnosticSignInfo",  { fg = MyColors.gold })
      vim.api.nvim_set_hl(0, "DiagnosticSignHint",  { fg = MyColors.hint })
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#3e4550" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#232323" })
        vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#232323" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#232323" })
        vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#232323" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#232323" })
        vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#232323" })
      end)

      require("ibl").setup {
        indent = {
          highlight = highlight,
          char = "┆"
        },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = {
          highlight = highlight,
          char = "│",
          -- show_start = true,
          -- show_end = true,
        },
      }

      vim.g.rainbow_delimiters = { highlight = highlight }
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
  }
}

