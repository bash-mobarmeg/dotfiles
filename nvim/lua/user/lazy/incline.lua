return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  priority = 1200,
  config = function()
    local incline = require("incline")

    incline.setup({
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      highlight = {
          groups = {
            InclineNormal = {
              default = true,
              group = "InclineNormal"
            },
            InclineNormalNC = {
              default = true,
              group = "InclineNormalNC"
            }
          },
      },
      render = function(props)
        -- Get current mode
        local mode_map = {
          n = "NOR",
          i = "INS",
          v = "VIS",
          V = "V-LINE",
          ["\22"] = "V-BLOCK", -- <C-v> block visual
          c = "CMD",
          R = "REP",
          t = "TERM",
        }

        local mode_colors = {
          n = "#48b0bd",
          i = "#A1C181",
          v = "#B477CF",
          V = "#B477CF",
          ["\22"] = "#B477CF",
          c = "#D07277",
          R = "#E89982",
          t = "#8EC07C",
        }

        local mode_code = vim.api.nvim_get_mode().mode
        local mode_label = mode_map[mode_code] or mode_code
        local mode_color = mode_colors[mode_code] or "#48b0bd"

        -- Count selected text if in visual mode
        local selection_info = ""
        if mode_code == "v" or mode_code == "V" or mode_code == "\22" then
          local _, ls, cs = unpack(vim.fn.getpos("v"))
          local _, le, ce = unpack(vim.fn.getpos("."))
          -- Normalize start/end positions
          if ls > le or (ls == le and cs > ce) then
            ls, le = le, ls
            cs, ce = ce, cs
          end

          local lines = vim.api.nvim_buf_get_lines(0, ls - 1, le, false)
          local count = 0
          if #lines == 1 then
            count = ce - cs + 1
          else
            count = #lines[1] - cs + 1
            for i = 2, #lines - 1 do
              count = count + #lines[i]
            end
            count = count + ce
          end

          selection_info = string.format(" (%d)", count)
        end

        -- Compose incline content
        local buffer = {
          { " ", guifg = mode_color },
          { mode_label, guifg = mode_color, gui = "normal" },
          { " ", guifg = mode_color, gui = "normal" },
          { selection_info, guifg = "#565c68" },
          { " ", guifg = mode_color },
        }

        return buffer
      end,
    })
  end,
}

