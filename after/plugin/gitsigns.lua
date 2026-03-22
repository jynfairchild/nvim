require('gitsigns').setup({
  -- Disable gutter signs (barbar still reads git data for tab indicators)
  signcolumn = false,
  -- Reduce file watching to save file descriptors
  watch_gitdir = {
    enable = false,
  },
  -- Disable auto-attach to reduce file usage
  attach_to_untracked = false,
  -- Update less frequently
  update_debounce = 500,
  -- Reduce max file size to process
  max_file_length = 10000,
})