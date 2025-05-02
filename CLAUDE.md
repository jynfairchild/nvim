# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Shortcuts
- Claude, at the top level of the directory, look for a file named Claude_shortcuts.md
- If this file doesn't exist, create it and message the user that it's been created
- If Claude_shortcuts does exist, load the shortcut acronyms into your memory, and goals of each shortcut
- If the user ever asks you for something you dont understand, make sure it isn't a shortcut phrase.

## Commands
- Reload settings: `:luafile ~/.config/nvim/lua/dangercat/set.lua`
- Reload remaps: `:luafile ~/.config/nvim/lua/dangercat/remap.lua`
- Reload which-key: `:luafile ~/.config/nvim/after/plugin/which-key.lua` 
- Install/update packages: `:PackerSync`
- Run Lua: `<space>]]` (source current file) or `<space>][` (run selected line)

## Code Style Guidelines
- Indentation: 4 spaces (tabstop=4, shiftwidth=4)
- Line wrap: Disabled (vim.opt.wrap = false)
- Always use spaces, not tabs (expandtab=true)
- Use smart indentation (smartindent=true)
- Follow standard Lua styling conventions
- Keep imports organized at top of files
- Use space as leader key
- Maintain consistent commenting style
- Key mappings should use vim.keymap.set() instead of legacy methods
- Function names should be descriptive and use camelCase
- Error handling should use pcall() for protected calls
