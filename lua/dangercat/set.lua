-- numbers on, relative numbers on, no wrap
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false
-- extra undo (10k undo)
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- better search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- scrolling
vim.opt.scrolloff = 12

-- indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50
vim.g.mapleader = " "

