-- Load local forestfloor for development (before colorscheme is set)
vim.opt.runtimepath:prepend("/Users/dangercat/Documents/GitHub/forestfloor.nvim")

require("dangercat")

-- Set default colorscheme
vim.cmd("colorscheme forestfloor")
