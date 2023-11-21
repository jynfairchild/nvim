-- move half way up and down while also keeping stuff in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

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
vim.keymap.set("x", "<leader>p", "\"_dP")

-- find file
vim.keymap.set("n", "<leader>f", function()
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
vim.keymap.set("n", "<f5>", "<C-w><Right><C-w><Down><Up>")
vim.keymap.set("t", "<f6>", "<C-\\><C-n><C-w><Left>")

-- split
vim.keymap.set("n", "<leader>sv", ":vsp<CR>")
vim.keymap.set("n", "<leader>sh", ":sp<CR>")

-- python
vim.keymap.set("n", "<C-\\>", ":!python3 %<CR>", { silent = true })


