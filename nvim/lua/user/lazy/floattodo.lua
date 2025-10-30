return {
  "vimichael/floatingtodo.nvim",
  config = function()
    local function find_project_root()
      -- Find the nearest directory containing a package.json
      local cwd = vim.fn.getcwd()
      local root = vim.fn.findfile("package.json", cwd .. ";")
      if root == "" then
          return cwd  -- fallback to current dir
      end
      return vim.fn.fnamemodify(root, ":h")
    end

    local project_root = find_project_root()
    local note_path = project_root .. "/NOTE.md"

    -- Create the NOTE.md file if it doesn’t exist
    -- if vim.fn.filereadable(note_path) == 0 then
    --   vim.fn.writefile({}, note_path)
    -- end

    require("floatingtodo").setup({
      target_file = note_path,
      border = "rounded",
      width = 0.99,
      height = 0.85,
      position = "center",
    })
  end,
}

