-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
print('packer loaded')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -----------------
    -- Core Plugins --
    -----------------

    -- Simple plugins (single line)
    use 'nvim-lua/plenary.nvim'         -- Required by many plugins
    use 'nvim-tree/nvim-web-devicons'   -- Icons for various plugins
    use 'mbbill/undotree'               -- Undo history visualizer
    use 'tpope/vim-fugitive'            -- Git integration
    use 'lewis6991/gitsigns.nvim'       -- Git status in gutter
    use 'romgrk/barbar.nvim'            -- Buffer tabs
    use 'goolord/alpha-nvim'            -- Dashboard
    use 'xiyaowong/transparent.nvim'    -- Background transparency
    use 'lukas-reineke/indent-blankline.nvim' -- Indentation guides
    use 'rktjmp/lush.nvim'              -- Color scheme framework
    use 'numToStr/FTerm.nvim'           -- Floating terminal

    -- Language and syntax
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'

    -- LSP and completion
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- AI assistance
    use {
        'greggh/claude-code.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('claude-code').setup() end
    }

    -- File explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons'},
    }

    -- Keybinding help
    use {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 150
            require("which-key").setup()
        end
    }

    -- Code completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},
            {'hrsh7th/cmp-vsnip'},
        },
        config = function() require("cmp").setup() end
    }

    -- Code commenting
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt = true},
        config = function() require('lualine').setup() end
    }

    -- Terminal
    use {
        'NvChad/nvterm',
        config = function() require('nvterm').setup() end
    }

    -- Todo comments highlighting
    use {
        'folke/todo-comments.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('todo-comments').setup {} end
    }

    -- Jupyter notebook support
    use {'dccsillag/magma-nvim', run = ':UpdateRemotePlugins'}

    ---------------------
    -- Color Schemes --
    ---------------------

    -- Apply colorschemes in sequence (last one sticks)
    use {'rose-pine/neovim', as = 'rose-pine'}
    use {'nyoom-engineering/oxocarbon.nvim', as = 'oxocarbon'}
    use {'fcpg/vim-fahrenheit', as = 'fahrenheit'}
    use {'sainnhe/sonokai', as = 'sonokai'}

    use {
        'navarasu/onedark.nvim',
        as = 'onedark',
        config = function() require('onedark').setup() end
    }

    use {
        'jynfairchild/twodark.nvim',
        as = 'twodark',
        config = function() require('twodark').setup() end
    }

    -- Set final colorscheme
    vim.cmd('colorscheme twodark')

    -- Disabled plugins (kept for reference)
    -- use {'hedyhli/outline.nvim', config = function() require("outline").setup() end}
end)
