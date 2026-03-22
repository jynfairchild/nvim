local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

vim.o.timeout = true
vim.o.timeoutlen = 150

local wk_opts = {
    preset = false,
    delay = 0,
    win = {
        no_overlap = true,
        title = true,
        title_pos = "center",
        border = "rounded",
        padding = { 2, 2, 2, 2 },
        col = 0.5,
        row = 0.9,
    },
    layout = {
        spacing = 1,
        width = 80,
    },
    show_help = false,
    show_keys = false,
    notify = false,
}

-- Call setup immediately so did_setup=true (blocks the 500ms auto-setup timer)
which_key.setup(wk_opts)

-- Call setup again after which-key's deferred load() finishes,
-- so our options stick (same as what :luafile reload does)
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.schedule(function()
            which_key.setup(wk_opts)
        end)
    end,
})

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
    { "<leader>;t",  desc = "Reload Forestfloor" },
    { "<leader>;A",  desc = "Reload All Plugins" },
    { "<leader>;T",  desc = "Toggle Theme Style" },
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



