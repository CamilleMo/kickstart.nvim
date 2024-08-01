local lspconfig = require 'lspconfig'
local util = require 'lspconfig/util'

-- Function to check for the presence of `deno.json` in the root directory
local function is_deno_project(root_dir)
  return util.path.exists(util.path.join(root_dir, 'deno.json'))
end

-- Function that will stop if the project is a Deno project
lspconfig.tsserver.setup {
  on_attach = function(client, _bufnr)
    local root_dir = client.config.root_dir
    if is_deno_project(root_dir) then
      -- If `deno.json` is present, stop tsserver
      client.stop()
    else
      -- Otherwise, proceed as usual
      -- You can put your usual on_attach logic here
    end
  end,
  root_dir = util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git'),
}

-- Setup denols
lspconfig.denols.setup {
  on_attach = function(client, bufnr)
    -- Your usual on_attach logic for denols
    local root_dir = client.config.root_dir
    if not is_deno_project(root_dir) then
      -- If `deno.json` is not present, stop denols
      client.stop()
    else
      -- Otherwise, proceed as usual
      -- You can put your usual on_attach logic here
    end
  end,
  root_dir = util.root_pattern('deno.json', '.git'),
  init_options = {
    enable = true,
    lint = true,
  },
}
