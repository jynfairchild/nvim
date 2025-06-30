-- vim.keymap.del("n", "<leader>t")

-- save
vim.keymap.set('n', '\\', ":w <CR>", { silent = true, })

-- move half way up and down while also keeping stuff in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "-", "12<C-y>")
vim.keymap.set("n", "=", "12<C-e>")

-- move to the front and back of a line
vim.keymap.set('n', ']', '$')
vim.keymap.set('n', '[', '0')
vim.keymap.set('v', ']', '$')
vim.keymap.set('v', '[', '0')

-- when searching go to the next search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- entering spaces
vim.keymap.set("n", "o", ":normal! o<CR>", { silent = true })
vim.keymap.set("n", "O", ":normal! O<CR>", { silent = true })
vim.keymap.set("n", "<leader>o", "o")
vim.keymap.set("n", "<leader>O", "O")

-- visual move up and down, highlight brakets
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
vim.keymap.set("n", "<leader>mm", function()
  vim.lsp.buf.format()
end, { noremap = true, silent = true, desc = "prettier" })

-- toggle between 2 and 4 spaces and update set.lua file
vim.keymap.set("n", "<leader>mt", function()
  -- Get current tabstop value
  local current_tabstop = vim.api.nvim_get_option_value("yeen", {})
  local new_tabstop = current_tabstop == 4 and 2 or 4

  -- Update the set.lua file using string patterns
  local set_path = vim.fn.expand("~/.config/nvim/lua/dangercat/set.lua")
  local content = table.concat(vim.fn.readfile(set_path), "\n")

  -- Replace all three indentation settings
  content = content:gsub("vim.opt.tabstop = %d+", "vim.opt.tabstop = " .. new_tabstop)
  content = content:gsub("vim.opt.shiftwidth = %d+", "vim.opt.shiftwidth = " .. new_tabstop)
  content = content:gsub("vim.opt.softtabstop = %d+", "vim.opt.softtabstop = " .. new_tabstop)

  -- Write the updated content back to the file
  vim.fn.writefile(vim.fn.split(content, "\n"), set_path)
  vim.cmd('luafile ' .. set_path)
  print("Indentation permanently set to " .. new_tabstop .. " spaces")
end, { noremap = true, silent = true, desc = "tabspace 2 or 4" })


-- Window resize in normal mode with incremental changes
vim.keymap.set("t", "<kMinus>", "<C-\\><C-n>:resize -8<CR>i")
vim.keymap.set("t", "<kPlus>", "<C-\\><C-n>:resize +8<CR>i")
vim.keymap.set("t", "<k7>", "<C-\\><C-n>:vertical resize +10<CR>i")
vim.keymap.set("t", "<k8>", "<C-\\><C-n>:vertical resize -10<CR>i")
vim.keymap.set("n", "<k7>", ":vertical resize -10<CR>")
vim.keymap.set("n", "<k8>", ":vertical resize +10<CR>")
vim.keymap.set("n", "<kMinus>", ":resize -8<CR>")
vim.keymap.set("n", "<kPlus>", ":resize +8<CR>")

-- split
vim.keymap.set("n", "<leader>sv", ":vsp<CR>")
vim.keymap.set("n", "<leader>sh", ":sp<CR>")

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
vim.keymap.set("n", "<f6>", "<C-w><Right><C-w><Down><Up>")
vim.keymap.set("t", "<f5>", "<C-\\><C-n><C-w><Left>")

-- Notes terminal
vim.keymap.set('n', '<k2>', ':FTermNotes<CR>', { noremap = true, silent = true, desc = "toggle notes" })
vim.keymap.set('t', '<k3>', ":wq <CR>", { silent = true, desc = "save and quit buffer" })

-- first small terminal
vim.keymap.set('n', '<k1>', ':FTermFirst<CR>', { noremap = true, silent = true, desc = "toggle small terminal" })
vim.keymap.set('t', '<k1>', '<C-\\><C-n>:FTermFirst<CR>', { noremap = true, silent = true, desc = "toggle terminal from inside" })

-- second large terminal
vim.keymap.set('n', '<k0>', ':FTermSecond<CR>', { noremap = true, silent = true, desc = "toggle large terminal" })
vim.keymap.set('t', '<k0>', '<C-\\><C-n>:FTermSecond<CR>', { noremap = true, silent = true, desc = "toggle terminal from inside" })

-- third large terminal
vim.keymap.set('n', '<kEnter>', ':FTermThird<CR>', { noremap = true, silent = true, desc = "toggle large terminal" })
vim.keymap.set('t', '<kEnter>', '<C-\\><C-n>:FTermThird<CR>', { noremap = true, silent = true, desc = "toggle terminal from inside" })


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
end, { noremap = true, silent = true, desc = "stack terminals" })


-- python
vim.keymap.set("n", "<C-\\>", ":!python3 %<CR>", { silent = true })

-- Mapping to run PackerSync
vim.keymap.set('n', '<leader>;p', function()
  vim.cmd [[:PackerSync]]
end, { noremap = true, silent = false, desc = "PackerSync" })

-- Mapping to run reload maps
vim.keymap.set('n', '<leader>;o', function()
  vim.cmd('luafile ~/.config/nvim/lua/dangercat/packer.lua')
end, { noremap = true, silent = false, desc = "reload packer" })

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
      detach = true       -- Run in background
    })

    -- Optional: Add a message to let you know it's running
    print("Running Love2D in: " .. project_dir)
  else
    print("Error: main.lua not found in current directory or any parent hey directories")
  end
end

-- Create keybinding for running Love2D (change to whatever key you prefer)
vim.keymap.set('n', '<leader>l', _G.run_love2d, { desc = "Run Love2D" })

-- set auto widths, called from after/plugins/smart_window_widths.lua
vim.api.nvim_set_keymap('n', '<leader>qw', ':SmartWindowWidths<CR>', { noremap = true, silent = true })


-- Toggle gitsigns (git status in gutter)
vim.keymap.set('n', '<leader>gt', function()
  local current_buf = vim.api.nvim_get_current_buf()
  local gitsigns = require('gitsigns')
  if vim.b[current_buf].gitsigns_head then
    gitsigns.detach(current_buf)
  else
    gitsigns.attach(current_buf)
  end
end, { noremap = true, silent = true, desc = "Git Toggle Signs" })


vim.keymap.set('n', '<leader>x', function()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd([[keeppatterns %s/^\s\+$//e]])
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.api.nvim_win_set_cursor(0, cursor_pos)
  print("Removed trailing spaces from blank lines and end of lines")
end, { noremap = true, silent = true, desc = "rm trailing space" })


vim.keymap.set('n', '<leader>pd', function()
  local cwd = vim.fn.getcwd()
  local project_name = vim.fn.fnamemodify(cwd, ":t")
  local pdx_path = cwd .. "/" .. project_name .. ".pdx"
  print("Working directory: " .. cwd)
  print("Project name: " .. project_name)
  print("PDX path: " .. pdx_path)
  local sdk_path = "/Users/dangercat/Developer/PlaydateSDK"
  if vim.fn.isdirectory(sdk_path) ~= 1 then
    sdk_path = "/Users/dangercat/Documents/PlaydateSDK"
  end

  if vim.fn.isdirectory(sdk_path) ~= 1 then
    print("ERROR: PlaydateSDK not found. Please install it or specify the correct path.")
    return
  end
  print("Using SDK at: " .. sdk_path)
  local cmd = "cd " .. vim.fn.shellescape(cwd)
      .. " && [ -d " .. vim.fn.shellescape(project_name .. ".pdx")
      .. " ] && rm -rf " .. vim.fn.shellescape(project_name .. ".pdx")
      .. " || true"
      .. " && " .. sdk_path .. "/bin/pdc . " .. project_name .. ".pdx"
  print("Running command: " .. cmd)
  vim.fn.jobstart(cmd, {
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        print("Successfully compiled " .. project_name .. ".pdx")
        local sim_cmd = "open -a \"Playdate Simulator\" " .. vim.fn.shellescape(pdx_path)
        print("Launching simulator: " .. sim_cmd)
        vim.fn.jobstart(sim_cmd, {
          on_exit = function(_, sim_exit_code)
            if sim_exit_code == 0 then
              print("Launched Playdate Simulator with " .. project_name .. ".pdx")
            else
              print("Failed to launch Playdate Simulator (exit code: " .. sim_exit_code .. ")")
            end
          end
        })
      else
        print("Failed to compile " .. project_name .. ".pdx (exit code: " .. exit_code .. ")")
      end
    end
  })
end, { noremap = true, silent = true, desc = "Compile and Run Playdate PDX" })


vim.keymap.set('n', '<leader>d', function()
  local diagnostics_enabled = vim.diagnostic.is_enabled()
  if diagnostics_enabled then
    vim.diagnostic.config({
      severity_sort = true,
      underline = {
        severity = { min = vim.diagnostic.severity.ERROR }
      },
      virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR }
      },
      signs = {
        severity = { min = vim.diagnostic.severity.ERROR }
      }
    })
    print("Warnings hidden, only errors showing")
  else
    vim.diagnostic.enable()
    vim.diagnostic.config({
      severity_sort = true,
      underline = true,
      virtual_text = true,
      signs = true
    })
    print("All diagnostics enabled")
  end
end, { noremap = true, silent = true, desc = "Toggle diagnostic warnings" })
