local ok, nnp = pcall(require, "no-neck-pain")
if not ok then
  vim.notify("no-neck-pain not installed", vim.log.levels.WARN)
  return
end

local setup_ok, err = pcall(nnp.setup, {
  width = 80,
  autocmds = {
    enableOnVimEnter = false,
    enableOnTabEnter = false,
  },
})

if not setup_ok then
  vim.notify("no-neck-pain setup failed: " .. tostring(err), vim.log.levels.ERROR)
end

-- no-neck-pain only activates cleanly from a single-window layout.
-- Detect whether it's already on by looking for its side buffers (named "no-neck-pain-left/-right");
-- if off, consolidate splits with :only first; if on, just toggle.
vim.keymap.set("n", "<leader>kq", function()
  local nnp_active = false
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    if name:match("no%-neck%-pain") then
      nnp_active = true
      break
    end
  end
  if not nnp_active then
    pcall(vim.cmd, "only") -- collapse to single window so the plugin has a clean slate
  end
  vim.cmd("NoNeckPain")
end, { silent = true, desc = "Toggle centered writing mode" })

vim.keymap.set("n", "<leader>kr", function()
  vim.ui.input({ prompt = "Width: ", default = "80" }, function(input)
    if input then vim.cmd("NoNeckPainResize " .. input) end
  end)
end, { silent = true, desc = "Resize centered writing column" })
