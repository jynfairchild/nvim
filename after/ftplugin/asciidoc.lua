-- Novel-writing mode for asciidoc buffers (mirrors markdown.lua)

vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.list = false

vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

-- Always move by visual line — paragraphs are one giant file line in asciidoc,
-- so [n]j/[n]k should mean "n visual lines" not "n paragraphs".
vim.keymap.set("n", "j", "gj", { buffer = true })
vim.keymap.set("n", "k", "gk", { buffer = true })
vim.keymap.set("v", "j", "gj", { buffer = true })
vim.keymap.set("v", "k", "gk", { buffer = true })

-- Quick-hop overrides — global '-'/'=' use <C-y>/<C-e> which scroll by file
-- lines (= whole paragraphs here). Buffer-local versions hop visual lines.
vim.keymap.set("n", "-", "12gk", { buffer = true })
vim.keymap.set("n", "=", "12gj", { buffer = true })

-- Arrow keys also respect visual lines (useful in insert mode where j/k type letters)
vim.keymap.set("n", "<Up>",   "gk", { buffer = true })
vim.keymap.set("n", "<Down>", "gj", { buffer = true })
vim.keymap.set("v", "<Up>",   "gk", { buffer = true })
vim.keymap.set("v", "<Down>", "gj", { buffer = true })
vim.keymap.set("i", "<Up>",   "<C-o>gk", { buffer = true })
vim.keymap.set("i", "<Down>", "<C-o>gj", { buffer = true })

-- V selects only the current visual line (default V grabs the whole paragraph
-- since asciidoc paragraphs are a single file line). Uses character-wise visual.
-- To delete a visual line: V then d.
vim.keymap.set("n", "V", "g0vg$", { buffer = true, desc = "Select current visual line" })
