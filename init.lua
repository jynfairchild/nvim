-- Load local twodark for development (before colorscheme is set)
vim.opt.runtimepath:prepend("/Users/dangercat/Documents/Github/twodark.nvim")

require("dangercat")

-- Set default colorscheme
vim.cmd("colorscheme twodark")
