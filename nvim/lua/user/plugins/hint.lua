-----------------------------------------------------
--  Project root finder
-----------------------------------------------------
local function find_project_root()
  local cwd = vim.fn.getcwd()

  -- Find nearest package.json upwards
  local root = vim.fn.findfile("package.json", cwd .. ";")

  if root == "" then
    return cwd -- fallback to current directory
  end

  return vim.fn.fnamemodify(root, ":h")
end

local project_root = find_project_root()
local note_path = project_root .. "/HINT.md"

-----------------------------------------------------
--  Variables for buffer + window
-----------------------------------------------------
local win_id = nil
local buf_id = nil

-----------------------------------------------------
--  Load notes from HINT.md
-----------------------------------------------------
local function load_notes()
  if vim.fn.filereadable(note_path) == 1 then
    local lines = vim.fn.readfile(note_path)
    vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
  else
    vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, {
      "# HINT.md not found",
      "",
      "This file will be created when you save.",
      "",
      note_path,
    })
  end
end

-----------------------------------------------------
--  Save notes back to HINT.md
-----------------------------------------------------
local function save_notes()
  if buf_id and vim.api.nvim_buf_is_valid(buf_id) then
    local lines = vim.api.nvim_buf_get_lines(buf_id, 0, -1, false)
    vim.fn.writefile(lines, note_path)
  end
end

-----------------------------------------------------
--  Toggle floating window
-----------------------------------------------------
local function hint_toggle()
  -- If window exists, close + save
  if win_id and vim.api.nvim_win_is_valid(win_id) then
    save_notes()
    vim.api.nvim_win_close(win_id, true)
    win_id = nil
    return
  end

  -- Create buffer if needed
  if not buf_id or not vim.api.nvim_buf_is_valid(buf_id) then
    buf_id = vim.api.nvim_create_buf(false, false) -- not scratch
    vim.api.nvim_buf_set_option(buf_id, "buftype", "nofile")
    vim.api.nvim_buf_set_option(buf_id, "bufhidden", "hide")
    vim.api.nvim_buf_set_option(buf_id, "swapfile", false)
    load_notes()
  end

  -- Floating window size/position
  local width = 40
  local height = 8

  local ui = vim.api.nvim_list_uis()[1]
  local col = ui.width - width - 1
  local row = ui.height - height - 1

  win_id = vim.api.nvim_open_win(buf_id, true, {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    border = "rounded",
    style = "minimal",
  })
end

-----------------------------------------------------
--  Keymap (same file)
-----------------------------------------------------
vim.keymap.set("n", "<A-n>", function()
  hint_toggle()
end, { desc = "Toggle project HINT.md window" })

