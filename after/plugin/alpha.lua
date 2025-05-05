local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

local v = vim.version()
local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

-- Set header
dashboard.section.header.val = {
    "██████╗  █████╗ ███╗  ██╗ ██████╗ ███████╗██████╗  █████╗  █████╗ ████████╗",
    "██╔══██╗██╔══██╗████╗░██║██╔════╝░██╔════╝██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝",
    "██║░░██║███████║██╔██╗██║██║░░██╗░█████╗░░██████╔╝██║░░╚═╝███████║░░░██║░░░",
    "██║░░██║██╔══██║██║╚████║██║░░╚██╗██╔══╝░░██╔══██╗██║░░██╗██╔══██║░░░██║░░░",
    "██████╔╝██║░░██║██║░╚███║╚██████╔╝███████╗██║░░██║╚█████╔╝██║░░██║░░░██║░░░",
    "╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░",
}

-- Set header and footer highlight colors
dashboard.section.header.opts = {
    hl = "Delimiter",
    position = "center"
}

dashboard.section.footer.opts = {
    hl = "Comment",
    position = "center"
}

-- Get header width
local header_width = #dashboard.section.header.val[1]

-- Create custom buttons with proper alignment and spacing
local function create_button(shortcut, text, cmd, hl_group, hl_shortcut_group)
    -- Create a custom formatted button with extra spacing
    local icon = "["..shortcut.."]"
    local txt = " "..text  -- Add space between shortcut and text

    -- Calculate width of button content
    local content_width = #icon + #txt

    -- Create the button manually
    local btn = {
        type = "button",
        val = icon..txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(cmd, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = {
            position = "center",
            shortcut = "[" .. shortcut .. "]",
            cursor = 13,
            width = 76, -- Reduced width by 20px from 110
            align_shortcut = "right",
            hl = hl_group,
            hl_shortcut = hl_shortcut_group,
            keymap = {"n", shortcut, cmd, {noremap = true, silent = true, nowait = true}},
        },
    }

    -- Calculate the left margin to align with header, shifted 20px to the left
    local left_margin = math.floor((vim.o.columns - header_width) / 5) - 20
    if left_margin < 0 then left_margin = 0 end

    -- Add left margin padding
    local left_padding = string.rep(" ", left_margin)
    btn.val = left_padding .. btn.val

    return btn
end

-- Create buttons with consistent colors
dashboard.section.buttons.val = {
    create_button("r", "Recent files", ":Telescope oldfiles <CR>", "AlphaButtonN", "AlphaShortcutN"),
    create_button("f", "Find file", ":Telescope <CR>", "AlphaButtonF", "AlphaShortcutF"),
    create_button("e", "File Explorer", "NvimTreeToggle<CR>", "AlphaButtonE", "AlphaShortcutE"),
    create_button("q", "Quit", ":q<CR>", "AlphaButtonQ", "AlphaShortcutQ"),
}

-- Will define these highlight groups after alpha is set up

-- Set button spacing only (we're manually handling alignment)
dashboard.section.buttons.opts = {
    spacing = 1
}

local function centerText(text, width)
    local totalPadding = width - #text
    local leftPadding = math.floor(totalPadding / 2)
    local rightPadding = totalPadding - leftPadding
    return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
end

dashboard.section.footer.val = {
    centerText(version, 50),
    centerText("config by DangerCat", 50),
}


-- Add vertical padding before header to center it
local padding_rows = math.floor(vim.o.lines / 3)
dashboard.opts.layout = {
    { type = "padding", val = padding_rows },
    dashboard.section.header,
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    { type = "padding", val = 0 },
    dashboard.section.footer,
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Define highlight groups after setup
vim.cmd([[
    augroup AlphaHighlights
        autocmd!
        autocmd FileType alpha highlight AlphaButtonN guifg=#5079DE gui=bold
        autocmd FileType alpha highlight AlphaButtonF guifg=#5079DE gui=bold
        autocmd FileType alpha highlight AlphaButtonE guifg=#5079DE gui=bold
        autocmd FileType alpha highlight AlphaButtonR guifg=#5079DE gui=bold
        autocmd FileType alpha highlight AlphaButtonQ guifg=#5079DE gui=bold

        autocmd FileType alpha highlight AlphaShortcutN guifg=#5079DE gui=bold
        autocmd FileType alpha highlight AlphaShortcutF guifg=#5079DE gui=bold
        autocmd FileType alpha highlight AlphaShortcutE guifg=#5079DE gui=bold
        autocmd FileType alpha highlight AlphaShortcutR guifg=#5079DE gui=bold
        autocmd FileType alpha highlight AlphaShortcutQ guifg=#5079DE gui=bold
    augroup END
]])

-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
