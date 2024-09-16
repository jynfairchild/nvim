-- move half way up and down while also keeping stuff in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "=", "12<C-y>")
vim.keymap.set("n", "-", "-12<C-e>")

-- when searching go to the next search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- entering spaces
vim.keymap.set("n", "o", ":normal! o<CR>", { silent = true })
vim.keymap.set("n", "O", ":normal! O<CR>", { silent = true })
vim.keymap.set("n", "<leader>o", "o")
vim.keymap.set("n", "<leader>O", "O")

-- visual move up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- keep copy over cut
vim.keymap.set("n", "<leader>pp", '"+p', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>po', '"_dP', { noremap = true, silent = true })

-- prettier format
vim.keymap.set("n", "<leader>mm", function()
    vim.lsp.buf.format()
end)

-- find and replace
vim.keymap.set("n", "<leader>h", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- naviage between splits
vim.keymap.set("n", "<C-l>", "<C-w><Right>")
vim.keymap.set("n", "<C-h>", "<C-w><Left>")
vim.keymap.set("n", "<C-k>", "<C-w><Up>")
vim.keymap.set("n", "<C-j>", "<C-w><Down>")

-- terminal
vim.keymap.set("n", "<leader>th", function() require("nvterm.terminal").toggle('horizontal') end)
vim.keymap.set("n", "<leader>tv", function() require("nvterm.terminal").toggle('vertical') end)
vim.keymap.set("n", "<f6>", "<C-w><Right><C-w><Down><Up>")
vim.keymap.set("t", "<f5>", "<C-\\><C-n><C-w><Left>")

-- split
vim.keymap.set("n", "<leader>sv", ":vsp<CR>")
vim.keymap.set("n", "<leader>sh", ":sp<CR>")

-- python
vim.keymap.set("n", "<C-\\>", ":!python3 %<CR>", { silent = true })

-- Commands
vim.keymap.set('n', 'v;', function()
    -- Move cursor to next specified character, in this case, a period
    vim.cmd('normal! f.')
    -- Move cursor one word forward to the start of the next word
    vim.cmd('normal! w')
    -- Enter visual mode and select the word
    vim.cmd('normal! viw')
end, { noremap = true, silent = true, desc = "Select word after period" })

-- Mapping to run PackerSync
vim.keymap.set('n', '<leader>;p', function()
    vim.cmd [[:PackerSync]]
end, { noremap = true, silent = false, desc = "PackerSync" })

-- Mapping to run reload maps
vim.keymap.set('n', '<leader>;r', function()
    vim.cmd('luafile ~/.config/nvim/lua/dangercat/remap.lua')
end, { noremap = true, silent = false, desc = "reload remaps" })

-- Mapping to run reload sets
vim.keymap.set('n', '<leader>;s', function()
    vim.cmd('luafile ~/.config/nvim/lua/dangercat/set.lua')
end, { noremap = true, silent = false, desc = "reload sets" })

-- colorscheme testing
vim.keymap.set('n', '<leader>;c', function()
    vim.cmd('colorscheme twodark')
end, { noremap = true, silent = false, desc = "change colorscheme" })


--Automatic Reload on File Change
-- vim.cmd [[command! ReloadRemaps luafile ~/.config/nvim/lua/dangercat/remap.lua]]

-- To automatically reload remaps.lua when changes are made, you can use an autocommand that listens for changes to the file. Add this to your Neovim configuration (init.lua or a suitable place in your setup):
--
-- lua
--
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "remaps.lua",
--   command = "luafile ~/.config/nvim/remaps.lua"
-- })


