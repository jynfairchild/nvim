  -- Put in your init.lua or a lua/plugin file
  local M = {}

  local function notify(msg, level)
  if vim.notify then vim.notify(msg, level or vim.log.levels.INFO) else print(msg) end
  end

  local function find_sdk()
  local candidates = {
      os.getenv("PLAYDATE_SDK_PATH"),
      "~/.local/share/PlaydateSDK",
      "~/Developer/PlaydateSDK",
      "~/Documents/PlaydateSDK",
  }
  for _, p in ipairs(candidates) do
      if p and p ~= "" then
        local abs = vim.fs.normalize(vim.fn.expand(p))
        local pdc = abs .. "/bin/pdc"
        if vim.loop.fs_stat(pdc) then
          return abs, pdc
        end
      end
  end
  return nil, nil
  end

  local function project_ctx()
  local cwd = vim.fn.getcwd()
  local name = vim.fn.fnamemodify(cwd, ":t")
  return cwd, name, (cwd .. "/" .. name .. ".pdx")
  end

  function M.build(opts)
  local cwd, name, pdx = project_ctx()
  local sdk, pdc = find_sdk()
  if not pdc then
      notify("PlaydateSDK not found. Set $PLAYDATE_SDK_PATH or install SDK.", vim.log.levels.ERROR)
      return
  end
  -- Clean existing .pdx safely
  if vim.loop.fs_stat(pdx) then
      local ok = (vim.fn.delete(pdx, "rf") == 0)
      if not ok then
        notify("Failed to delete existing " .. pdx, vim.log.levels.WARN)
      end
  end
  notify("Building " .. name .. ".pdx ...")
  vim.system({ pdc, ".", name .. ".pdx" }, { cwd = cwd, text = true }, function(res)
      if res.code ~= 0 then
        notify("Build failed (" .. res.code .. "): " .. (res.stderr or ""), vim.log.levels.ERROR)
        return
      end
      notify("Build OK: " .. pdx)
      if opts and opts.run then
        M.run_sim(pdx)
      end
  end)
  end

  function M.run_sim(pdx_path)
  local sys = vim.loop.os_uname().sysname
  if sys == "Darwin" then
      vim.system({ "open", "-a", "Playdate Simulator", pdx_path }, { text = true }, function(res)
        if res.code ~= 0 then
          notify("Failed to launch Playdate Simulator: " .. (res.stderr or ""), vim.log.levels.ERROR)
        else
          notify("Launched Playdate Simulator with " .. pdx_path)
        end
      end)
  else
      -- Basic Linux fallback
      vim.system({ "xdg-open", pdx_path }, { text = true }, function(res)
        if res.code ~= 0 then
          notify("Failed to open simulator: " .. (res.stderr or ""), vim.log.levels.ERROR)
        else
          notify("Opened PDX: " .. pdx_path)
        end
      end)
  end
  end

  -- User commands and mapping
  vim.api.nvim_create_user_command("PlaydateBuild", function() M.build({ run = false }) end, {})
  vim.api.nvim_create_user_command("PlaydateRun", function() M.build({ run = true }) end, {})
  vim.keymap.set("n", "pd", function() M.build({ run = true }) end, { desc = "Playdate: build and run" })

  -- Optional: auto-build on save (commented out)
  -- vim.api.nvim_create_autocmd("BufWritePost", {
  --   pattern = { ".lua", ".p8", "*.json" }, -- tweak for your project
  --   callback = function() M.build({ run = false }) end,
  -- })

