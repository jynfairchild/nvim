
-- Force load which-key, even if it hasn't been loaded by packer yet
vim.cmd[[packadd which-key.nvim]]

-- Ensure which-key is loaded and initialized with proper settings
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

-- Basic timeout settings
vim.o.timeout = true
vim.o.timeoutlen = 150

-- Disable startup notifications for which-key
-- This prevents warnings about overlaps from showing at startup
local silence_warnings = vim.api.nvim_create_augroup("which_key_silence", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = silence_warnings,
    pattern = "*",
    callback = function()
        -- Clear any which-key notifications that might be showing
        vim.defer_fn(function()
            -- Just skip the notification dismissal as it's not available in this Neovim version
            -- Notifications will time out on their own
        end, 100)
    end,
    once = true
})

-- Add this setup configuration to change the style
which_key.setup{
    -- Replace triggers_nowait with delay option
    -- triggers_nowait is deprecated in favor of delay
    delay = 0,
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

    -- Disable warnings about overlapping keymaps
    ignore_warning = {
        "overlapping", -- Silence warnings about overlapping keymaps
    },
}


-- Use the existing which_key variable instead of creating a new one
which_key.add({

    { "<leader>O",   desc = "New Line Above Insert" },
    { "<leader>o",   desc = "New Line Below Insert" },

    -- Run Lua ]
    { "<leader>]",   desc = "Run lua" },
    { "<leader>][",  desc = "Run File .lua" },
    { "<leader>]]",  desc = "Run Visual Lines .lua" },

    -- Find
    { "<leader>f",   desc = "File" },
    { "<leader>ff",  desc = "Find Files" },
    { "<leader>fg",  desc = "Grep Find" },
    { "<leader>fb",  desc = "Buffer Find" },

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



