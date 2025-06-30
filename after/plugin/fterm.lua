local fterm = require('FTerm')

-- Setup the main FTerm instance for notes
fterm.setup({
    border = 'double',
    cmd = 'nvim /Users/dangercat/.config/nvim/nvim_notes.md',
    dimensions = {
        height = 1,
        width = 0.3,
        x = .98,
        y = .7,
    },
})

-- Create a second terminal instance
local first_term = fterm:new({
    ft = 'fterm_regular',
    border = 'double',
    dimensions = {
        height = 0.68,
        width = 0.2,
        x = .98,
        y = .8,
    },
})

local second_term = fterm:new({
    ft = 'second_term',
    border = 'double',
    dimensions = {
        height = 1,
        width = 0.4,
        x = 1.1,
        y = .7,
    },
})

local third_term = fterm:new({
    ft = 'third_term',
    border = 'double',
    dimensions = {
        height = 1,
        width = 0.4,
        x = 1.1,
        y = .7,
    },
})

-- Create commands to make these terminals accessible
vim.api.nvim_create_user_command('FTermNotes', fterm.toggle, { bang = true })
vim.api.nvim_create_user_command('FTermFirst', function() first_term:toggle() end, { bang = true })
vim.api.nvim_create_user_command('FTermSecond', function() second_term:toggle() end, { bang = true })
vim.api.nvim_create_user_command('FTermThird', function() third_term:toggle() end, { bang = true })


