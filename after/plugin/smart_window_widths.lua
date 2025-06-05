local smart_window_widths = function()
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
    -- Check for terminal windows
    local term_wins = {}
    for i = 1, win_count do
        vim.cmd(i .. 'wincmd w')
        local buf = vim.fn.winbufnr(0)
        local buf_type = vim.fn.getbufvar(buf, '&buftype')
        if buf_type == 'terminal' then
            table.insert(term_wins, i)
        end
    end

    -- if 3 panel
    if win_count == 3 then
        if has_nvim_tree then
            vim.cmd(nvim_tree_win .. 'wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.12))
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

    -- if 4 panel
    elseif win_count == 4 then
        -- Get window information to detect stacking
        local columns_used = {}

        -- Collect window position information
        for i = 1, win_count do
            vim.cmd(i .. 'wincmd w')
            local win_id = vim.fn.win_getid()
            local info = vim.fn.getwininfo(win_id)[1]

            -- Track unique columns
            columns_used[info.wincol] = true
        end

        -- Count unique columns (fewer columns than windows means stacking)
        local column_count = 0
        for _ in pairs(columns_used) do
            column_count = column_count + 1
        end

        -- Detect if we have stacked windows (fewer columns than windows)
        local has_stacked_windows = column_count < win_count

        if has_nvim_tree then
            vim.cmd(nvim_tree_win .. 'wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.12))

            -- Find non-tree windows
            local non_tree_windows = {}
            for i = 1, win_count do
                if i ~= nvim_tree_win then
                    table.insert(non_tree_windows, i)
                end
            end

            if has_stacked_windows then
                -- With stacked windows: NvimTree (10%) | Buffer1 (55%) | Stacked (35%)
                vim.cmd(non_tree_windows[1] .. 'wincmd w')
                vim.cmd('vertical resize ' .. math.floor(total_width * 0.60))
                print("Windows resized with NvimTree (stacked): 10% | 55% | 35%")
            else
                -- No stacking: NvimTree (10%) | Buffer1 (50%) | Buffer2 (25%) | Buffer3 (15%)
                vim.cmd(non_tree_windows[1] .. 'wincmd w')
                vim.cmd('vertical resize ' .. math.floor(total_width * 0.40))
                vim.cmd(non_tree_windows[2] .. 'wincmd w')
                vim.cmd('vertical resize ' .. math.floor(total_width * 0.25))
                print("Windows resized with NvimTree (no stacking): 10% | 50% | 25% | 15%")
            end

            -- Return to a good working buffer
            vim.cmd('2wincmd w')
        else
            if has_stacked_windows then
                -- With stacked windows: Buffer1 (40%) | Buffer2 (30%) | Stacked (30%)
                vim.cmd('1wincmd w')
                vim.cmd('vertical resize ' .. math.floor(total_width * 0.45))
                vim.cmd('2wincmd w')
                vim.cmd('vertical resize ' .. math.floor(total_width * 0.30))
                print("Windows resized (stacked): 40% | 30% | 30%")
            else
                -- No stacking: Buffer1 (30%) | Buffer2 (30%) | Buffer3 (20%) | Buffer4 (20%)
                vim.cmd('1wincmd w')
                vim.cmd('vertical resize ' .. math.floor(total_width * 0.45))
                vim.cmd('2wincmd w')
                vim.cmd('vertical resize ' .. math.floor(total_width * 0.35))
                vim.cmd('3wincmd w')
                vim.cmd('vertical resize ' .. math.floor(total_width * 0.20))
                print("Windows resized (no stacking): 30% | 30% | 20% | 20%")
            end

            -- Return to first buffer for focus
            vim.cmd('1wincmd w')
        end

    -- if 5 panel
    elseif win_count == 5 then
        -- Assume windows 4 and 5 are stacked in the rightmost column
        if has_nvim_tree then
            -- NvimTree (10%) | Buffer1 (45%) | Buffer2 (25%) | Buffers 4&5 (20%)
            vim.cmd(nvim_tree_win .. 'wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.12))

            -- Find non-tree windows (buffers)
            local non_tree_windows = {}
            for i = 1, win_count do
                if i ~= nvim_tree_win then
                    table.insert(non_tree_windows, i)
                end
            end

            -- Resize first three non-tree windows
            if #non_tree_windows >= 3 then
                vim.cmd(non_tree_windows[1] .. 'wincmd w')
                vim.cmd('vertical resize ' .. math.floor(total_width * 0.40))
                vim.cmd(non_tree_windows[2] .. 'wincmd w')
                vim.cmd('vertical resize ' .. math.floor(total_width * 0.20))
            end

            print("Windows resized with NvimTree: 10% | 45% | 25% | 20% (stacked)")
            -- Return to a good working buffer (assumed to be buffer 2)
            vim.cmd('2wincmd w')
        else
            -- No NvimTree: Buffer1 (35%) | Buffer2 (25%) | Buffer3 (20%) | Buffers 4&5 (20%)
            -- Resize the first three windows
            vim.cmd('1wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.35))
            vim.cmd('2wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.25))
            vim.cmd('3wincmd w')
            vim.cmd('vertical resize ' .. math.floor(total_width * 0.20))

            print("Windows resized to 35% | 25% | 20% | 20% (stacked)")
            -- Return to first buffer for focus
            vim.cmd('1wincmd w')
        end
    else
        print("Layout not supported. Window count: " .. win_count)
    end
end

-- Register the command with a reference to the local function
vim.api.nvim_create_user_command('SmartWindowWidths', function()
    smart_window_widths()
end, {})

-- Export the function
return {
    smart_window_widths = smart_window_widths
}
