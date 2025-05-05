require("dangercat.set")
require("dangercat.remap")
require("dangercat.packer")
require 'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'Lua 5.4',

            },
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
}

-- require("dangercat.set")
print("dangercat set, remap, loaded")
