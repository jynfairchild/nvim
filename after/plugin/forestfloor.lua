-- Basic setup for forestfloor.nvim
local ok, forestfloor = pcall(require, 'forestfloor')
if not ok then
    vim.notify("forestfloor not found!", vim.log.levels.ERROR)
    return
end

forestfloor.setup({
    style = 'night',
    transparent = false,
    term_colors = true,
    ending_tildes = false,
    cmp_itemkind_reverse = false,
    toggle_style_key = "<leader>;T",
    toggle_style_list = { 'night', 'night_transparent', 'day' },
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

forestfloor.load()
