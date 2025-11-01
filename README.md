# 🧩 Dotfiles

## Overview
This repository contains my personal configuration files for a modern Linux development setup using **Hyprland**, **Neovim**, and essential CLI tools.
It’s designed for performance, aesthetics, and productivity — featuring a Lua-based Neovim setup and a lightweight Wayland desktop environment.

---

## ⚙️ Installation

Clone and run the setup script:

```bash
git clone https://github.com/bash-mobarmeg/dotfiles.git
cd dotfiles
chmod +x setup.sh
./setup.sh
```


# 🪟 Desktop Environment
Window Manager: Hyprland

- Launcher: Wofi / Rofi
- Status Bar: Waybar
- Terminal: Alacritty
- Theme Support: Nordic, Kanagawa, Tokyonight, Rose Pine, and more

# 📝 Neovim Configuration
- Main Features
  - Plugin management with lazy.nvim
  - LSP, DAP, and Treesitter integration
  - Autocompletion via nvim-cmp and LuaSnip
  - Code formatting and linting with none-ls.nvim
  - Debugging and testing tools (DAP + Neotest)
  - Multiple color schemes and UI enhancements
  - Optimized for fast startup and smooth workflow

- Core Plugins (Selection)
  - nvim-lspconfig (LSP setup)
  - nvim-cmp + LuaSnip + friendly-snippets (Completion & snippets)
  - mason.nvim + mason-lspconfig.nvim (LSP installer)
  - nvim-treesitter (Syntax highlighting)
  - telescope.nvim (Fuzzy finder)
  - nvim-dap + nvim-dap-ui + nvim-dap-virtual-text (Debugger)
  - trouble.nvim, noice.nvim, fidget.nvim (UI enhancements)
  - indent-blankline.nvim, hlargs.nvim, incline.nvim (Code visuals)
  - barbecue, nvim-navic (Breadcrumbs)
  - rest.nvim, vim-dadbod, vim-dadbod-ui (API/DB tools)
  - transparent.nvim, tokyonight.nvim, nordic.nvim, rose-pine, etc. (Themes)

- Additional utilities:
  - Navigation: hop.nvim, cinnamon.nvim, vim-tmux-navigator
  - Terminals: FTerm.nvim
  - Inline tools: tiny-inline-diagnostic.nvim, floatingtodo.nvim
  - Misc: live-rename.nvim, smear-cursor.nvim, ccc.nvim

- Optional lazy-loaded plugins:
  - curl.nvim, markdown-preview.nvim, nvim-autopairs, nx.nvim, sqlua.nvim


# 🧠 Directory Structure
```bash
~/.config/
├── hypr/ → Hyprland configs
├── waybar/ → Waybar settings
├── alacritty/ → Terminal theme and font
├── nvim/ → Neovim configuration
└── rofi/ | wofi/ → App launchers
```

# 💡 Notes
- Neovim AppImage is installed as /usr/bin/nv
- All plugins managed with lazy.nvim
- NVM automatically installs the latest Node.js version

# 🧑‍💻 Author
- bash-mobarmeg
- Minimal, fast, and productive Linux setup.
