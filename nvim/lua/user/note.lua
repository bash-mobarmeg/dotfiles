-- @NOTE - Test

-- Namespace for highlighting
local ns = vim.api.nvim_create_namespace("todo_highlights")

-- Define custom highlight groups
vim.api.nvim_set_hl(0, "TodoHighlight",  { fg = "#000000", bg = MyColors.yellow, bold = true })
vim.api.nvim_set_hl(0, "FixmeHighlight", { fg = "#000000", bg = MyColors.warn, bold = true })
vim.api.nvim_set_hl(0, "NoteHighlight",  { fg = "#000000", bg = MyColors.accent, bold = true })

-- Function to highlight annotations in the current buffer
local function highlight_todos()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  -- Define keywords and corresponding highlight groups
  local keywords = {
    ["@TODO"] = "TodoHighlight",
    ["@FIXME"] = "FixmeHighlight",
    ["@BUG"]  = "FixmeHighlight",
    ["@NOTE"] = "NoteHighlight",
  }

  for i, line in ipairs(lines) do
    for kw, hl_group in pairs(keywords) do
      -- Find all occurrences of the keyword in the line
      for start_pos, _ in line:gmatch("()" .. kw) do
        local end_pos = start_pos + #kw
        vim.api.nvim_buf_set_extmark(buf, ns, i - 1, start_pos - 1, {
          end_col = end_pos - 1,
          hl_group = hl_group,
        })
      end
    end
  end
end


local function highlight_todos_line()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  for i, line in ipairs(lines) do
    local hl_group = nil

    if line:match("@TODO") then
      hl_group = "TodoHighlight"
    elseif line:match("@FIXME") or line:match("@BUG") then
      hl_group = "FixmeHighlight"
    elseif line:match("@NOTE") then
      hl_group = "NoteHighlight"
    end

    if hl_group then
      vim.api.nvim_buf_set_extmark(buf, ns, i - 1, 0, {
        end_row = i - 1,
        end_col = #line,
        hl_group = hl_group,
        hl_eol = true,  -- This extends highlight to end of line!
      })
    end
  end
end

-- Automatically highlight todos on certain events
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged", "TextChangedI" }, {
  callback = highlight_todos,
})

local function search_for_annotations()
  local project_dir = vim.fn.getcwd()
  local patterns = "@TODO|@NOTE|@BUG"
  local exts = { "js", "ts", "lua" }

  local cmd = {
    "rg",
    "--no-heading",
    "--line-number",
    "--color=never",
    "--smart-case",
    "--hidden",  -- optional: include dotfiles if needed
    "--ignore-file", ".gitignore", -- respects root ignore file
    "--glob", "!**/node_modules/*",
    "--glob", "!**/dist/*",
    "--glob", "!**/build/*",
    "--glob", "!**/.logs/*",
  }

  -- Suppose `file` is the absolute path returned by rg
  for _, ext in ipairs(exts) do
    table.insert(cmd, "--glob")
    table.insert(cmd, "*." .. ext)
  end

  table.insert(cmd, patterns)
  table.insert(cmd, project_dir)

  -- Run rg
  local result = vim.fn.systemlist(cmd)

  -- Convert absolute paths to relative paths
  local relative_results = {}
  for _, line in ipairs(result) do
    local path, rest = line:match("([^:]+):(.*)")
    if path and rest then
      local rel_path = path:gsub("^" .. vim.pesc(project_dir) .. "/?", "")
      table.insert(relative_results, rel_path .. ":" .. rest)
    end
  end

  return relative_results
end


-- Function to display the results in a floating window
local function show_in_buffer(results)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, results)

  local width = 80
  local height = math.min(#results + 2, 20)
  local editor_width = vim.o.columns
  local editor_height = vim.o.lines
  local row = math.floor((editor_height - height) / 2 - 1)
  local col = math.floor((editor_width - width) / 2)

  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Map Enter to jump to file
  vim.api.nvim_buf_set_keymap(buf, 'n', '<CR>', '', {
    noremap = true,
    silent = true,
    callback = function()
      local line = vim.api.nvim_get_current_line()
      local file, lnum = line:match("^(.+):(%d+)")
      if file and lnum then
        vim.api.nvim_win_close(win, true)
        vim.cmd("edit " .. file)
        vim.api.nvim_win_set_cursor(0, {tonumber(lnum), 0})
      else
        vim.notify("Could not parse line: " .. line)
      end
    end,
  })

  -- 🧠 Add this: close the window when pressing "q"
  vim.keymap.set('n', 'q', function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, nowait = true, silent = true })
end


-- Function to search for annotations and show them in a buffer
local function search_and_show()
  local results = search_for_annotations()

  if #results > 0 then
    show_in_buffer(results)
  else
    vim.notify("No annotations found!")
  end
end

-- Alternatively, you can create a custom command for this
vim.api.nvim_create_user_command('TodoAnnotations', search_and_show, {})

-- Keybinding to trigger the annotation search
vim.api.nvim_set_keymap('n', '<leader>ta', ':TodoAnnotations<CR>', { noremap = true, silent = true })

