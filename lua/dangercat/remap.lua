-- move half way up and down while also keeping stuff in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "=", "12<C-y>")
vim.keymap.set("n", "-", "-12<C-e>")

-- move to the front and back of a line
vim.keymap.set('n', '0', '$')
vim.keymap.set('n', '9', '0')

-- when searching go to the next search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- entering spaces
vim.keymap.set("n", "o", ":normal! o<CR>", { silent = true })
vim.keymap.set("n", "O", ":normal! O<CR>", { silent = true })
vim.keymap.set("n", "<leader>o", "o")
vim.keymap.set("n", "<leader>O", "O")

-- visual move up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- keep copy over cut
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>p', '"_dP', { noremap = true, silent = true })

-- prettier format
vim.keymap.set("n", "<leader>m", function()
    vim.lsp.buf.format()
end)

-- find and replace
vim.keymap.set("n", "<leader>h", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- naviage between splits
vim.keymap.set("n", "<C-l>", "<C-w><Right>")
vim.keymap.set("n", "<C-h>", "<C-w><Left>")
vim.keymap.set("n", "<C-k>", "<C-w><Up>")
vim.keymap.set("n", "<C-j>", "<C-w><Down>")

-- terminal
vim.keymap.set("n", "<leader>th", function() require("nvterm.terminal").toggle('horizontal') end)
vim.keymap.set("n", "<leader>tv", function() require("nvterm.terminal").toggle('vertical') end)

vim.keymap.set("n", "<leader>ty", function()
    -- Open horizontal terminal
    require("nvterm.terminal").toggle('horizontal')

    -- Wait briefly for terminal to open and then navigate out
    vim.defer_fn(function()
        -- This is the equivalent of pressing Ctrl-w then k
        vim.cmd("wincmd k")

        -- Open vertical terminal
        vim.defer_fn(function()
            require("nvterm.terminal").toggle('vertical')

            -- Navigate out and then close the buffer
            vim.defer_fn(function()
                -- This is the equivalent of pressing Ctrl-w then h
                vim.cmd("wincmd h")
                vim.cmd("q")

                -- Navigate back down to the bottom terminal
                vim.defer_fn(function()
                    -- This is the equivalent of pressing Ctrl-w then j
                    vim.cmd("wincmd j")
                end, 100)
            end, 100)
        end, 100)
    end, 100)
end)


-- get out of terminal mode, back to buffer
vim.keymap.set("n", "<f6>", "<C-w><Right><C-w><Down><Up>")
vim.keymap.set("t", "<f5>", "<C-\\><C-n><C-w><Left>")

-- split
vim.keymap.set("n", "<leader>sv", ":vsp<CR>")
vim.keymap.set("n", "<leader>sh", ":sp<CR>")

-- python
vim.keymap.set("n", "<C-\\>", ":!python3 %<CR>", { silent = true })

-- Commands
vim.keymap.set('n', 'v;', function()
    -- Move cursor to next specified character, in this case, a period
    vim.cmd('normal! f.')
    -- Move cursor one word forward to the start of the next word
    vim.cmd('normal! w')
    -- Enter visual mode and select the word
    vim.cmd('normal! viw')
end, { noremap = true, silent = true, desc = "Select word after period" })

-- Mapping to run PackerSync
vim.keymap.set('n', '<leader>;p', function()
    vim.cmd [[:PackerSync]]
end, { noremap = true, silent = false, desc = "PackerSync" })

-- Mapping to run reload maps
vim.keymap.set('n', '<leader>;r', function()
    vim.cmd('luafile ~/.config/nvim/lua/dangercat/remap.lua')
end, { noremap = true, silent = false, desc = "reload remaps" })

-- Mapping to run reload sets
vim.keymap.set('n', '<leader>;s', function()
    vim.cmd('luafile ~/.config/nvim/lua/dangercat/set.lua')
end, { noremap = true, silent = false, desc = "reload sets" })

-- Mapping to reload which-key
vim.keymap.set('n', '<leader>;w', function()
    vim.cmd('luafile ~/.config/nvim/after/plugin/which-key.lua')
end, { noremap = true, silent = false, desc = "reload which-key" })

-- colorscheme testing
vim.keymap.set('n', '<leader>;c', function()
    vim.cmd('colorscheme twodark')
end, { noremap = true, silent = false, desc = "reload twodark" })


-- running lua
vim.keymap.set('n', "<space>]]", "<cmd>source %<CR>")
vim.keymap.set('n', "<space>][", ":.lua<CR>")
vim.keymap.set('v', "<space>][", ":lua<CR>")

function _G.run_love2d()
    -- Find the directory containing main.lua
    local current_file_dir = vim.fn.expand("%:p:h")
    local main_lua_path = vim.fn.findfile("main.lua", current_file_dir .. ";")

    -- If main.lua is found, get its directory
    if main_lua_path ~= "" then
        local project_dir = vim.fn.fnamemodify(main_lua_path, ":h")

        -- Run Love2D in the project directory
        vim.fn.jobstart("cd " .. vim.fn.shellescape(project_dir) .. " && love .", {
            detach = true -- Run in background
        })

        -- Optional: Add a message to let you know it's running
        print("Running Love2D in: " .. project_dir)
    else
        print("Error: main.lua not found in current directory or any parent hey directories")
    end
end

-- Create keybinding for running Love2D (change to whatever key you prefer)
vim.keymap.set('n', '<leader>]l', _G.run_love2d, { desc = "Run Love2D" })


-- Window sizes
vim.api.nvim_create_user_command('SmartWindowWidths', function()

    -- Count visible windows
    local win_count = vim.fn.winnr('$')

    -- Check if NvimTree is open
    local has_nvim_tree = false
    local nvim_tree_win = -1
    -- Loop through all windows to find NvimTree
    for i = 1, win_count do
        vim.cmd(i .. 'wincmd w')
        local buf = vim.fn.winbufnr(0)
        local buf_name = vim.fn.bufname(buf)
        if buf_name:match("NvimTree") then
            has_nvim_tree = true
            nvim_tree_win = i
            break
        end
    end

    local total_width = vim.o.columns

    -- Different sizing based on whether NvimTree is open and window count
    if win_count == 3 then
        if has_nvim_tree then
            vim.cmd(nvim_tree_win .. 'wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.1))

            -- Find the non-tree windows
            local other_windows = {}
            for i = 1, win_count do
                if i ~= nvim_tree_win then
                    table.insert(other_windows, i)
                end
            end

            vim.cmd(other_windows[1] .. 'wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.6))
            print("Windows resized with NvimTree: 10% | 60% | 30%")
            vim.cmd('2wincmd w')
        else
            vim.cmd('1wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.5))
            vim.cmd('2wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.35))
            print("Windows resized to 50% | 30% | 20%")
            vim.cmd('1wincmd w')
        end
    elseif win_count == 4 then
        if has_nvim_tree then
            vim.cmd(nvim_tree_win .. 'wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.1))

            -- Find the non-tree windows
            local other_windows = {}
            for i = 1, win_count do
                if i ~= nvim_tree_win then
                    table.insert(other_windows, i)
                end
            end

            vim.cmd(other_windows[1] .. 'wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.5))
            vim.cmd(other_windows[2] .. 'wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.25))
            print("Windows resized with NvimTree: 10% | 50% | 25% | 15% ")
            -- Return to original window
            vim.cmd('2wincmd w')
        else
            vim.cmd('1wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.30))
            vim.cmd('2wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.30))
            vim.cmd('3wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.4))
            print("Windows resized to 30% | 30% | 20% | 20% ")
        end
    else
        print("Layout not supported. Window count: " .. win_count)
    end
end, {})

-- Map the function to a key
vim.api.nvim_set_keymap('n', '<leader>qw', ':SmartWindowWidths<CR>', { noremap = true, silent = true })



