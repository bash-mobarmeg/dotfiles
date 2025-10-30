return {
    { "slugbyte/lackluster.nvim" },
    { "projekt0n/github-nvim-theme" },
    { "LunarVim/darkplus.nvim" },
    { "sainnhe/sonokai" },
    { "tanvirtin/monokai.nvim" },
    { "rebelot/kanagawa.nvim" },

    {
        "AlexvZyl/nordic.nvim",
        config = function()
            local options = {
                -- This callback can be used to override the colors used in the base palette.
                on_palette = function(palette) end,
                -- This callback can be used to override the colors used in the extended palette.
                after_palette = function(palette) end,
                -- This callback can be used to override highlights before they are applied.
                on_highlight = function(highlights, palette) end,
                -- Enable bold keywords.
                bold_keywords = false,
                -- Enable italic comments.
                italic_comments = true,
                -- Enable editor background transparency.
                transparent = {
                    -- Enable transparent background.
                    bg = true,
                    -- Enable transparent background for floating windows.
                    float = true,
                },
                -- Enable brighter float border.
                bright_border = false,
                -- Reduce the overall amount of blue in the theme (diverges from base Nord).
                reduced_blue = true,
                -- Swap the dark background with the normal one.
                swap_backgrounds = true,
                -- Cursorline options.  Also includes visual/selection.
                cursorline = {
                    -- Bold font in cursorline.
                    bold = true,
                    -- Bold cursorline number.
                    bold_number = true,
                    -- Available styles: 'dark', 'light'.
                    theme = 'dark',
                    -- Blending the cursorline bg with the buffer bg.
                    blend = 0.85,
                },
                noice = {
                    -- Available styles: `classic`, `flat`.
                    style = 'flat',
                },
                telescope = {
                    -- Available styles: `classic`, `flat`.
                    style = 'flat',
                },
                leap = {
                    -- Dims the backdrop when using leap.
                    dim_backdrop = false,
                },
                ts_context = {
                    -- Enables dark background for treesitter-context window
                    dark_background = true,
                }
            }

            require('nordic').setup(options)
        end
    },

    { "olimorris/onedarkpro.nvim" },
    {
        "navarasu/onedark.nvim",
        config = function()
            local options = {
                style = 'darker',
                transparent = true,          -- Show/hide background
                term_colors = true,          -- Change terminal color as per the selected theme style
                ending_tildes = false,       -- Show the end-of-buffer tildes. By default they are hidden
                cmp_itemkind_reverse = true, -- reverse item kind highlights in cmp menu
                lualine = {
                    transparent = true,      -- lualine center bar transparency
                },
            }

            -- require('onedark').setup(options)
            -- require('onedark').load()
        end
    },

    {
        "water-sucks/darkrose.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local options = {
                -- Override colors
                colors = {
                    orange = "#F87757",
                },
                -- Override existing or add new highlight groups
                overrides = function(c)
                    return {
                        Class = { fg = c.magenta },
                        ["@variable"] = { fg = c.fg_dark },
                    }
                end,
                -- Styles to enable or disable
                styles = {
                    bold = true,      -- Enable bold highlights for some highlight groups
                    italic = false,   -- Enable italic highlights for some highlight groups
                    underline = true, -- Enable underline highlights for some highlight groups
                }
            }

            -- require("darkrose").setup(options)
        end
    },

    {
        "ilof2/posterpole.nvim",
        config = function()
            local options = {
                transparent = true,
                colorless_bg = false,           -- grayscale or not
                dim_inactive = false,           -- highlight inactive splits
                brightness = 0,                 -- negative numbers - darker, positive - lighter
                selected_tab_highlight = false, --highlight current selected tab
                fg_saturation = 0,              -- font saturation, gray colors become more brighter
                bg_saturation = 0,              -- background saturation
                colors = {
                    posterpole = {},            -- { mainRed = "#550000" }
                    posterpole_term = {},       -- { mainRed = 95 }
                },
                lualine = {
                    transparent = true
                }
            }

            -- Default
            -- require("posterpole").setup(options)
        end
    },

    {
        "catppuccin/nvim",
        config = function()
            local options = {
                flavour = "auto", -- latte, frappe, macchiato, mocha
                background = {    -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false, -- disables setting the background color.
                show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
                term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false,            -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15,          -- percentage of the shade to apply to the inactive window
                },
                no_italic = false,              -- Force no italic
                no_bold = false,                -- Force no bold
                no_underline = false,           -- Force no underline
                styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" },    -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                color_overrides = {},
                custom_highlights = {},
                default_integrations = true,
                integrations = {
                  cmp = true,
                  gitsigns = true,
                  nvimtree = true,
                  treesitter = true,
                  notify = false,
                  mini = {
                    enabled = true,
                    indentscope_color = "",
                  },
                  -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            }

            -- require("catppuccin").setup(options)
        end
    },

    {
        "daschw/leaf.nvim",
        config = function()
            local options = {
                underlineStyle = "underline",
                commentStyle = "italic",
                functionStyle = "NONE",
                keywordStyle = "italic",
                statementStyle = "bold",
                typeStyle = "NONE",
                variablebuiltinStyle = "italic",
                transparent = true,
                colors = {},
                overrides = {},
                theme = "auto",    -- default, based on vim.o.background, alternatives: "light", "dark"
                contrast = "high", -- default, alternatives: "medium", "high"
            }

            -- require("leaf").setup(options)
        end
    },

    {
      "folke/tokyonight.nvim",
      opts = {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      }
    },

    {
        "Tsuzat/NeoSolarized.nvim",
        config = function()
            local options = {
                style = "dark",         -- "dark" or "light"
                transparent = true,     -- true/false; Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                enable_italics = true,  -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
                styles = {
                    -- Style to be applied to different syntax groups
                    comments = { italic = true },
                    keywords = { italic = false },
                    functions = { bold = true },
                    variables = {},
                    string = { italic = false },
                    underline = true, -- true/false; for global underline
                    undercurl = true, -- true/false; for global undercurl
                },
            }

            -- require("NeoSolarized").setup(options)
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            local options = {
                disable_background = true,
                styles = {
                    italic = false,
                    bold = true,
                    transparency = true,
                },
            }

            -- require('rose-pine').setup(options)
        end
    },

}
