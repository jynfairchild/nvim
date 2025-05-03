

-- Add this setup configuration to change the style
require("which-key").setup({
    triggers_nowait = { "[", "]" },
    win = {  -- Use 'win' instead of 'window'
        no_overlap = true,
        title = true,
        title_pos = "center",
        border = "rounded",
        padding = { 2, 2, 2, 2 },
        col = 0.5,  -- Center horizontally
        row = 0.9,  -- Position near bottom of screen
    },
    layout = {
        preset = "classic",
        spacing = 1,
        width = 80,
    },
    show_help = false,      -- Hide the help message at the bottom
    show_keys = false,
})


local wk = require("which-key")
wk.add({

    { "<leader>O",   desc = "New Line Above Insert" },
    { "<leader>o",   desc = "New Line Below Insert" },

    -- Run Lua ]
    { "<leader>]",   desc = "Run lua" },
    { "<leader>][",  desc = "Run File .lua" },
    { "<leader>]\\", desc = "Run love ." },
    { "<leader>]]",  desc = "Run Visual Lines .lua" },

    -- Find
    { "<leader>f",   desc = "File" },
    { "<leader>ff",  desc = "Find Files" },
    { "<leader>fg",  desc = "Grep Find" },

    -- Unique
    { "<leader>g",   desc = "Git" },
    { "<leader>h",   desc = "Find and Replace" },
    { "<leader>o",   desc = "New Line Insert" },

    -- Split
    { "<leader>s",   desc = "Split" },
    { "<leader>sh",  desc = "Horizontal" },
    { "<leader>sv",  desc = "Verticle" },

    -- Terminal/Toggle
    { "<leader>t",   desc = "Terminal/Toggle" },
    { "<leader>th",  desc = "Horizontal" },
    { "<leader>tv",  desc = "Verticle" },

    -- Reload nvim Lua
    { "<leader>;",   desc = "Reload nvim Lua" },
    { mode = { "v" }, { "<leader>]", desc = "Run Lua Highlighted segment" } },

    -- Copy Paste
    { "<leader>u",   desc = "Undo Tree" },
    { "<leader>y",   desc = "Copy to clipboard" },
    { "<leader>Y",   desc = "Copy Line to clipboard" },
    { mode = { "v" }, { "<leader>y", desc = "Copy to clipboard" } },
    { "<leader>p",   desc = "Paste Keep Copy" },
    { mode = { "v" }, { "<leader>p", desc = "Paste Keep Copy" } },

    -- Prettier Format
    { "<leader>m",   desc = "Prettier Format" },

    -- set window widths
    { "<leader>q",   desc = "Set Window Widths" },
    { "<leader>qw",   desc = "Set Window Widths" },


})



