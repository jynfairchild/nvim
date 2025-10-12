-- Development reload function (commented out for later iterations)
-- local function reload_twodark()
--     -- Clear the module from cache
--     package.loaded['twodark'] = nil
--     package.loaded['twodark.colors'] = nil
--     package.loaded['twodark.config'] = nil
--     package.loaded['twodark.theme'] = nil
--     package.loaded['twodark.terminal'] = nil
--
--     -- Clear any other twodark modules
--     for k, _ in pairs(package.loaded) do
--         if k:match('^twodark') then
--             package.loaded[k] = nil
--         end
--     end
--
--     -- Check if twodark is available
--     local ok, twodark = pcall(require, 'twodark')
--     if not ok then
--         print("Twodark not found! Run :PackerSync first")
--         return
--     end
--
--     -- Reload and apply
--     twodark.setup({
--         style = 'warmer',
--         transparent = true,
--         term_colors = true,
--         ending_tildes = false,
--         cmp_itemkind_reverse = false,
--         toggle_style_key = "<leader>ts",
--         toggle_style_list = { "warmer" },
--         code_style = {
--             comments = 'italic',
--             keywords = 'none',
--             functions = 'none',
--             strings = 'none',
--             variables = 'none'
--         },
--         lualine = {
--             transparent = false,
--         },
--         colors = {},
--         highlights = {},
--         diagnostics = {
--             darker = false,
--             undercurl = false,
--             background = false,
--         },
--     })
--
--     twodark.load()
--     print("Twodark colorscheme reloaded!")
-- end
--
-- -- Keymapping for quick reload during development
-- vim.keymap.set('n', '<leader>tr', reload_twodark, { desc = 'Reload twodark colorscheme' })
--
-- -- Initial load
-- reload_twodark()

-- Basic setup for official twodark.nvim
local ok, twodark = pcall(require, 'twodark')
if not ok then
    vim.notify("Twodark not found! Run :PackerSync first", vim.log.levels.ERROR)
    return
end

-- Setup twodark with your preferences
twodark.setup({
    style = 'warmer',
    transparent = true,
    term_colors = true,
    ending_tildes = false,
    cmp_itemkind_reverse = false,
    toggle_style_key = "<leader>ts",
    toggle_style_list = { "warmer" },
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
    lualine = {
        transparent = false,
    },
    colors = {},
    highlights = {},
    diagnostics = {
        darker = false,
        undercurl = false,
        background = false,
    },
})

-- Load the colorscheme
twodark.load()
