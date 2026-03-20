# nvim

My personal build of nvim, plugins, sets, remaps, configs, oh my.

## Fresh Install Guide

### 1. Install Neovim

```bash
brew install neovim
```

### 2. Install External Dependencies

```bash
# Required
brew install ripgrep          # telescope + todo-comments search
brew install tree-sitter-cli  # treesitter parser compilation
brew install node             # copilot dependency

# Optional (game dev)
# brew install love           # Love2D framework
# Playdate SDK: https://play.date/dev/
```

### 3. Install Packer (Plugin Manager)

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
```

### 4. Install Custom Colorscheme

The active colorscheme is `twodark.nvim`, loaded from a local dev path:

```bash
cd ~/Documents/Github
git clone <your-twodark-repo-url> twodark.nvim
```

### 5. Create Undo Directory

```bash
mkdir -p ~/.vim/undodir
```

### 6. Install Plugins

Open Neovim and run:

```
:PackerSync
```

This installs all plugins defined in `lua/dangercat/packer.lua`.

### 7. Install LSP Servers

Mason should auto-install on first open, but you can trigger manually:

```
:MasonInstall gopls
:MasonInstall python-lsp-server
:MasonInstall lua-language-server
```

### 8. Install Treesitter Parsers

Parsers must be installed manually:

```
:TSInstall go gomod gosum python c lua vim vimdoc query typescript tsx
```

### 9. Verify Everything Works

| Check                  | Command              | Expected                          |
|------------------------|----------------------|-----------------------------------|
| Plugins loaded         | `:PackerStatus`      | All plugins listed                |
| LSP servers installed  | `:Mason`             | gopls, pylsp, lua_ls installed    |
| Treesitter parsers     | `:TSInstallInfo`     | go, python, lua, etc. installed   |
| LSP attached to file   | `:LspInfo` (in file) | Server attached                   |
| Syntax highlighting    | Open a `.go` file    | Colored syntax                    |

## Plugin List

| Plugin | Purpose |
|--------|---------|
| packer.nvim | Plugin manager |
| plenary.nvim | Utility library (dependency) |
| nvim-web-devicons | File icons |
| telescope.nvim | Fuzzy finder |
| nvim-treesitter | Syntax highlighting |
| nvim-treesitter-context | Sticky context header |
| lsp-zero.nvim | LSP setup helper |
| nvim-lspconfig | LSP configuration |
| mason.nvim | LSP server manager |
| mason-lspconfig.nvim | Mason + lspconfig bridge |
| nvim-cmp | Autocompletion |
| cmp-nvim-lsp | LSP completion source |
| cmp-buffer | Buffer completion source |
| cmp-path | Path completion source |
| cmp-cmdline | Command line completion |
| cmp-vsnip | Snippet completion source |
| LuaSnip | Snippet engine |
| cmp_luasnip | LuaSnip + cmp bridge |
| undotree | Undo history visualizer |
| barbar.nvim | Buffer tab bar |
| alpha-nvim | Dashboard / start screen |
| transparent.nvim | Background transparency |
| indent-blankline.nvim | Indentation guides |
| lush.nvim | Colorscheme framework |
| lualine.nvim | Status line |
| vim-fugitive | Git integration |
| gitsigns.nvim | Git gutter signs |
| FTerm.nvim | Floating terminal |
| nvterm | Terminal integration |
| nvim-tree.lua | File explorer |
| Comment.nvim | Code commenting |
| which-key.nvim | Keybinding discovery |
| todo-comments.nvim | Todo highlighting |
| claude-code.nvim | Claude Code integration |
| copilot.vim | GitHub Copilot |
| magma-nvim | Jupyter notebook support |
| twodark.nvim | Custom colorscheme (local) |
| onedark.nvim | One Dark colorscheme |
| oxocarbon.nvim | Oxocarbon colorscheme |
| vim-fahrenheit | Fahrenheit colorscheme |
| sonokai | Sonokai colorscheme |
