-- lua/custom/keymaps.lua

-- Map 'jk' to 'Esc' in normal, visual, and insert modes using vim.keymap.set
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- buffer management commands
vim.keymap.set('n', '<leader>bc', ':bd<CR>', { noremap = true, silent = true, desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>bw', ':w<CR>', { noremap = true, silent = true, desc = 'Write (save) current buffer' })
-- vim.keymap.set('n', ',w', ':w<CR>', { noremap = true, silent = true, desc = 'Write (save) current buffer' })
vim.keymap.set('n', '<leader>bb', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Switch to previous buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true, desc = 'Switch to next buffer' })
local telescope_builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>bl', telescope_builtin.buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>ba', ':e #<CR>', { noremap = true, silent = true, desc = 'Switch to alternate buffer' })
--  NOTE: do :w file.txt to save a new buffer
vim.keymap.set('n', '<leader>be', ':enew<CR>', { noremap = true, silent = true, desc = 'Open a new buffer - enew' })

-- code commands
vim.keymap.set('n', '<leader>cc', ':normal gcc<CR>', { noremap = true, silent = true, desc = '[C]ode [C]omment' })

-- neogit
vim.keymap.set('n', '<leader>gs', ':Neogit<CR>', { noremap = true, silent = true, desc = 'Open Neogit' })
vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { noremap = true, silent = true, desc = 'Neogit Commit' })
vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { noremap = true, silent = true, desc = 'Neogit pull' })
vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { noremap = true, silent = true, desc = 'Neogit push' })
vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', { noremap = true, silent = true, desc = 'Neogit see branches' })
-- vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { noremap = true, silent = true, desc = 'Open Neogit' })

-- custom code insertion
vim.keymap.set('n', '<leader>cid', ':read !date --iso-8601<CR>', { noremap = true, silent = true, desc = '[C]ode [I]nsert [D]ate' })
vim.keymap.set('n', '<leader>cit', ':read !date<CR>', { noremap = true, silent = true, desc = '[C]ode [I]nsert [T]imestamp' })

-- LSP helper
vim.keymap.set('n', 'gl', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', { noremap = true, silent = true, desc = 'LSP: [G]o to [L]ine diagnostic' })

-- misc
vim.keymap.set('n', '<leader>Q', ':qa!<CR>', { noremap = true, silent = true, desc = 'FORCE QUIT' })
vim.keymap.set('n', '<leader>X', ':luafile %<CR>', { noremap = true, silent = true, desc = 'Execute the entire lua file' })
vim.keymap.set('v', '<leader>x', ':lua<CR>', { noremap = true, silent = true, desc = 'Execute lua lines' })
