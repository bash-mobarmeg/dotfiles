-----------------------------------------------------------
-- ⚙️  Neovim Core Settings — Clean & Modern Setup
-- Author: You
-- Style: Minimal / Fast / Aesthetic
-----------------------------------------------------------

-----------------------------------------------------------
-- 🧭  BASIC UI
-----------------------------------------------------------
-- Block cursor everywhere
vim.opt.guicursor = ""

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Hide command-line unless typing
vim.o.cmdheight = 0
vim.opt.laststatus = 0 -- Hide global statusline

-- Custom tabline
vim.o.showtabline = 2 -- Always show tabline
vim.o.tabline = "%!v:lua.MyTabLine()"


-----------------------------------------------------------
-- 🧱  INDENTATION & TABS
-----------------------------------------------------------
vim.opt.tabstop = 2         -- A <Tab> counts for 4 spaces
vim.opt.softtabstop = 2     -- Tab spacing in insert mode
vim.opt.shiftwidth = 2      -- Indent amount
vim.opt.expandtab = true    -- Convert tabs to spaces
vim.opt.smartindent = true  -- Smart autoindent


-----------------------------------------------------------
-- 📜  FILES & UNDO
-----------------------------------------------------------
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


-----------------------------------------------------------
-- 🔍  SEARCH
-----------------------------------------------------------
vim.opt.hlsearch = false    -- Don’t highlight all matches
vim.opt.incsearch = true    -- Incremental search


-----------------------------------------------------------
-- 🎨  UI TWEAKS
-----------------------------------------------------------
vim.opt.termguicolors = true         -- True color support
vim.opt.scrolloff = 8                -- Keep 8 lines visible
vim.opt.signcolumn = "yes"           -- Always show sign column
vim.opt.isfname:append("@-@")        -- Allow @ in filenames
vim.opt.updatetime = 50              -- Faster updates

-- Hide end-of-buffer tildes and customize folds
vim.opt.fillchars = {
  foldopen = '▾',  -- Icon for open fold
  foldclose = '▸', -- Icon for closed fold
  fold = ' ',
  foldsep = ' ',
  eob = ' ',       -- Blank out ~ lines
}

-- Wrapping & invisible characters
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars:append("eol:↴")  -- ⤹ ⤸ ⤴  ⤵  ⤶  ↫  ↴  ⮐   ↩   ↷   ⃕  ↲


-----------------------------------------------------------
-- 🗂️  FOLDING
-----------------------------------------------------------
vim.o.signcolumn = "yes"     -- Always show sign column
vim.o.foldcolumn = "0"       -- Hide fold column by default
vim.o.foldlevel = 99         -- Open all folds by default
vim.o.foldlevelstart = 99
vim.o.foldenable = true


-----------------------------------------------------------
-- 💻  PERFORMANCE & FILE NAVIGATION
-----------------------------------------------------------
vim.opt.wildignore:append({ "*/target/*" }) -- Ignore build folders
vim.opt.wrap = false                        -- No line wrap


-----------------------------------------------------------
-- 🧩  OPTIONAL SETTINGS
-----------------------------------------------------------
-- vim.o.conceallevel = 2     -- Hide concealable syntax like Markdown ``
-- vim.o.concealcursor = 'nc' -- Conceal in normal + command modes only
-- vim.opt.guifont = "Victor Mono" -- For Neovide / GUIs

-----------------------------------------------------------
-- ✅  Config Loaded
-----------------------------------------------------------

