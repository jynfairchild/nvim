local mason = require("mason")

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  log_level = vim.log.levels.INFO,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

vim.lsp.config("gopls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = true,
      completeUnimported = true,
    },
  },
})

vim.lsp.config("pylsp", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = true },
        pyflakes = { enabled = true },
        pydocstyle = { enabled = false },
      },
    },
  },
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config("ltex_plus", {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "markdown", "asciidoc", "text", "plaintex", "tex", "gitcommit" },
  settings = {
    ltex = {
      language = "en-US",
      additionalRules = {
        enablePickyRules = true,
      },
      disabledRules = {
        ["en-US"] = { "PROFANITY" },
      },
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = { "gopls", "pylsp", "lua_ls", "ltex_plus" },
  automatic_enable = false,
})

for _, server in ipairs({ "gopls", "pylsp", "lua_ls", "ltex_plus" }) do
  vim.lsp.enable(server)
end

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  underline = true,
  signs = true,
  float = {
    border = "rounded",
    source = true,    -- show "ltex_plus" so you know what flagged it
    focusable = false,
    scope = "cursor", -- only the diagnostic on the exact cursor word
  },
})

-- Auto-show diagnostic float when cursor pauses on a problem word.
-- Normal mode only (don't pop while typing). updatetime=50 makes this near-instant.
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    -- Skip if a float (any kind) is already open
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(win).relative ~= "" then return end
    end
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})
