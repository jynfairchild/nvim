-- Configure Mason
local mason_path = vim.fn.stdpath("data") .. "/mason"

-- Create a function to install servers through Mason API
local function ensure_installed(servers)
    local registry = require("mason-registry")
    local installed = false

    -- Map LSP names to Mason package names
    local package_map = {
        pylsp = "python-lsp-server",
        -- Add more mappings as needed
    }

    for _, server_name in ipairs(servers) do
        local package_name = package_map[server_name] or server_name

        if not registry.is_installed(package_name) then
            vim.notify("Installing " .. package_name .. " via Mason", vim.log.levels.INFO)

            -- Use the registry API instead of vim.cmd
            local pkg = registry.get_package(package_name)
            if pkg then
                pkg:install()
                installed = true
            else
                vim.notify("Package not found: " .. package_name, vim.log.levels.ERROR)
            end
        end
    end

    if installed then
        vim.notify("Mason has installed missing packages. Restart Neovim for changes to take effect.", vim.log.levels.INFO)
    end
end

-- List of servers to install (using lsp server names)
local servers = {
    'pylsp',
    -- Add other servers you need here
}

-- Setup Mason with custom configuration
vim.api.nvim_create_autocmd("User", {
    pattern = "MasonToolsStartingInstall",
    callback = function()
        vim.notify("Mason is installing packages...", vim.log.levels.INFO)
    end
})

vim.api.nvim_create_autocmd("User", {
    pattern = "MasonToolsFinishedInstall",
    callback = function(event)
        vim.notify("Mason has finished installing " .. event.data.num_succeeded .. " package(s)", vim.log.levels.INFO)
    end
})

-- Ensure servers are installed when Neovim starts
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Wait a bit before checking to make sure Mason registry is loaded
        vim.defer_fn(function()
            ensure_installed(servers)
        end, 100)
    end
})