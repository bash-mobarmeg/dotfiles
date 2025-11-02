-- Table to keep track of active notifications
local active_notifiers = {}

local function custom_notify(msg, level, timeout)
  level = level or "INFO"
  timeout = timeout or 2000

  -- Limit width to 50% of screen or message length
  local width = math.min(math.floor(vim.o.columns * 0.5), #msg + 4)
  local height = 3
  local buf = vim.api.nvim_create_buf(false, true)

  -- Add empty line padding
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "", msg, "" })

  -- Calculate row based on how many active notifications exist
  local row = 2  -- starting row
  for _, win in ipairs(active_notifiers) do
    if vim.api.nvim_win_is_valid(win) then
      row = row + vim.api.nvim_win_get_height(win) + 1
    end
  end

  local col = (vim.o.columns - width) / 2

  local win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  -- Add to active_notifiers
  table.insert(active_notifiers, win)

  -- Auto close after timeout
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
    -- Remove from active_notifiers
    for i, w in ipairs(active_notifiers) do
      if w == win then
        table.remove(active_notifiers, i)
        break
      end
    end
  end, timeout)
end

-- Example usage
custom_notify("Annotation search complete!", "INFO")
custom_notify("Second notification", "WARN")
custom_notify("Another one!", "INFO")

