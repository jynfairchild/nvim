-- Novel-writing mode for markdown buffers

-- Soft wrap: no hard line breaks in file, wrap at word boundaries on screen
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.list = false -- 'list' breaks linebreak, force it off

-- Spell check on by default for prose
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

-- Move by visual line on wrapped paragraphs (only when no count given,
-- so 5j still jumps 5 file-lines for relative-number navigation)
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, buffer = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, buffer = true })
vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, buffer = true })
vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, buffer = true })
