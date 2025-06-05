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
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.timeoutlen = 10
vim.g.mapleader = " "

vim.g.copilot_assume_mapped = true
vim.opt.fillchars = { eob = " " }

-- comments
vim.opt.formatoptions:remove({ 'c', 'r', 'o' })

-- Setting guicursor for different modes
vim.opt.guicursor = {
  -- Normal mode
  "n-v-c:block-Cursor/lCursor",               -- block cursor with default color
  -- Insert mode
  "i-ci-ve:ver20-CursorInsert/lCursorInsert", -- vertical bar cursor with different color
  -- Replace mode
  "r-cr:hor20-CursorReplace/lCursorReplace",  -- horizontal bar cursor
  -- Command mode
  "sm:block-CursorCommand/lCursorCommand",    -- block cursor for command mode
}


-- command line two lines, gets rid of "Press ENTER..."
vim.opt.cmdheight = 2

-- disable title to prevent iTerm2 from showing icons in tabs
vim.opt.title = false
