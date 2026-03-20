require'nvim-treesitter.config'.setup {}

-- Neovim 0.11+ handles treesitter highlighting natively.
-- Enable it for all buffers via an autocmd.
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
