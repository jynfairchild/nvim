require("dangercat.set")
require("dangercat.remap")
require("dangercat.packer")
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'Lua 5.4',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})

vim.lsp.enable('lua_ls')

-- require("dangercat.set")
print("dangercat set, remap, loaded")
