local fterm = require('FTerm')

-- Setup the main FTerm instance for notes
-- notes
fterm.setup({
    border = 'double',
    cmd = 'nvim /Users/dangercat/Library/CloudStorage/Dropbox/Notes/nvim/nvim_notes.md',
    dimensions = {
        height = .7,
        width = 0.6,
        x = .8,
        y = .7,
    },
})

-- Create a second terminal instance
local first_term = fterm:new({
    ft = 'fterm_regular',
    border = 'double',
    dimensions = {
        height = .8,
        width = 0.8,
        x = .9,
        y = .15,
    },
})

local second_term = fterm:new({
    ft = 'second_term',
    border = 'double',
    dimensions = {
        height = .8,
        width = 0.8,
        x = .9,
        y = .15,
    },
})

local third_term = fterm:new({
    ft = 'third_term',
    border = 'double',
    dimensions = {
        height = .8,
        width = 0.8,
        x = .9,
        y = .15,
    },
})

-- k4 
local fourth_term = fterm:new({
    ft = 'fourth_term',
    border = 'double',
    dimensions = {
        height = .7,
        width = 0.48,
        x = 1,
        y = .7,
    },
})

-- k5
local fifth_term = fterm:new({
    ft = 'fifth_term',
    border = 'double',
    dimensions = {
        height = .7,
        width = 0.49,
        x = 0,
        y = .7,
    },
})

local sixth_term = fterm:new({
    ft = 'sixth_term',
    border = 'double',
    dimensions = {
        height = 1,
        width = 0.4,
        x = 1.1,
        y = .7,
    },
})

local seventh_term = fterm:new({
    ft = 'seventh_term',
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
vim.api.nvim_create_user_command('FTermFourth', function() fourth_term:toggle() end, { bang = true })
vim.api.nvim_create_user_command('FTermFifth', function() fifth_term:toggle() end, { bang = true })
vim.api.nvim_create_user_command('FTermSixth', function() sixth_term:toggle() end, { bang = true })
vim.api.nvim_create_user_command('FTermSeventh', function() seventh_term:toggle() end, { bang = true })


