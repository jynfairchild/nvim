-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
print('packer loaded')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -------------------
    -- Goat Packages --
    -------------------
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use {
        'greggh/claude-code.nvim',
        requires = {
            'nvim-lua/plenary.nvim', -- Required for git operations
        },
        config = function()
            require('claude-code').setup()
        end
    }

    -- use {
    --     'hedyhli/outline.nvim',
    --     config = function()
    --         require("outline").setup()
    --     end
    -- }

    -- juypter notbooks
    use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }

    use {
        'hrsh7th/nvim-cmp',
        requires = { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'neovim/nvim-lspconfig' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'hrsh7th/cmp-vsnip' },
        config = function()
            require("cmd").setup()
        end
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 150
            require("which-key").setup()
        end
    }


    -- Tabbar
    use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
    use 'romgrk/barbar.nvim'


    -- Background transparent
    use('xiyaowong/transparent.nvim')


    -- Packages
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup()
        end
    }
    use {
        "NvChad/nvterm",
        config = function()
            require("nvterm").setup()
        end,
    }
    use {
        'folke/todo-comments.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('todo-comments').setup {}
        end
    }

    -- trash taste
    use { "lukas-reineke/indent-blankline.nvim" }
    use { 'rktjmp/lush.nvim' }

    -- Colorschemes
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    vim.cmd('colorscheme rose-pine')

    use({ 'nyoom-engineering/oxocarbon.nvim', as = 'oxocarbon' })
    vim.cmd('colorscheme oxocarbon')

    use { "fcpg/vim-fahrenheit", as = "fahrenheit" }
    vim.cmd('colorscheme fahrenheit')

    use { "sainnhe/sonokai", as = "sonokai" }
    vim.cmd('colorscheme sonokai')

    use { "navarasu/onedark.nvim", as = "onedark",
        config = function()
            require('onedark').setup()
        end
    }
    vim.cmd('colorscheme onedark')


    use { "jynfairchild/twodark.nvim", as = "twodark",
        config = function()
            require('twodark').setup()
        end
    }
    vim.cmd('colorscheme twodark')


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }


end)
