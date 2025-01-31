-- Set what character to display for empty lines
vim.opt.fillchars = { eob = " " }

-- Ensure that Neovim shows the "best" version of a colorscheme
vim.o.termguicolors = true

-- Disable the default Neovim file explorer (REQUIRED)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Indentation
vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Code folding
vim.o.foldenable = true
vim.o.foldcolumn = "0"
vim.o.foldtext = ""
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Spell checking
vim.o.spell = true

-- Don't wrap text around the screen horizontally
vim.o.wrap = false

-- Ignore uppercase letters unless the search term has an uppercase letter
vim.o.smartcase = true

-- For GUI Neovim clients e.g. Neovide
vim.o.guifont = "JetBrainsMono Nerd Font:h10"
