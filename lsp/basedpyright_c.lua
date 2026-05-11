return {
  -- Command and arguments to start the server.
  cmd = { 'basedpyright-langserver', '--stdio' },
  -- Filetypes to automatically attach to.
  filetypes = { 'python' },

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a ".luarc.json" or a
  -- ".luarc.jsonc" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  root_markers = { 'pyproject.toml', 'pyrightconfig.json', 'ruff.toml', '.ruff.toml', '.git' },

  -- Specific settings to send to the server. The schema for this is
  -- defined by the server. For example the schema for lua-language-server
  -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = true,
      },
    },
  },
}

-- 1. Built-in (no plugin needed)
-- :checkhealth vim.lsp
-- This is the official replacement. It shows attached clients per buffer, root dirs, capabilities, and recent log entries —
-- basically a superset of what :LspInfo used to display.
--
-- 2. nvim-lspconfig still ships :LspInfo
-- If you have a recent nvim-lspconfig installed, :LspInfo should still work — it's now just a thin wrapper that opens :checkhealth
-- vim.lsp. If :LspInfo is missing, your nvim-lspconfig is either not installed or not loaded. Check with:
-- :lua print(vim.fn.exists(':LspInfo'))
-- Returns 2 if the command exists.
--
-- 3. Community plugin with the old floating-window UX
-- If you specifically miss the compact floating window from the old :LspInfo, nvim-lspinfo
-- (https://github.com/lopi-py/luau-lsp.nvim) clones aside, the closest replacements are:
-- - lsp-lens.nvim (https://github.com/VidocqH/lsp-lens.nvim) (different focus though)
-- - Just bind :checkhealth vim.lsp to a key
--
-- Quick one-liner for "why didn't this LSP attach to this buffer?"
-- :lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))
-- Combined with :LspLog (still works) and :set ft? to confirm filetype matches the server's filetypes, that covers ~90% of
-- attachment debugging.
