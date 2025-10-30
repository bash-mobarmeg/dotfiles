return {
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
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#3e4550" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#232323" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#232323" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#232323" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#232323" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#232323" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#232323" })
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

-- │, ┃, ┆, ┇, ┊, ┋, ╎, ╏, ║, ╽, ╿
