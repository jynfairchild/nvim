-- Novel-writing mode for asciidoc buffers (mirrors markdown.lua)

vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.list = false

vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, buffer = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, buffer = true })
vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, buffer = true })
vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, buffer = true })
