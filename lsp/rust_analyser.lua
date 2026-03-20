return {
  -- Command and arguments to start the server.
  cmd = { 'rust-analyzer' },

  -- Filetypes to automatically attach to.
  filetypes = { 'rust' },
  -- To install rust analyzer, run:
  -- rustup component add rust-src
  -- rustup component add rust-analyzer
  -- OR
  -- brew install rust-analyzer
  -- OR
  -- pacman -S rust-analyzer
  -- ===================================================================================================
  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a ".luarc.json" or a
  -- ".luarc.jsonc" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  -- root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },

  -- Specific settings to send to the server. The schema for this is
  -- defined by the server. For example the schema for lua-language-server
  -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  -- settings = {},
}
