-- lua/custom/keymaps.lua

-- Map 'jk' to 'Esc' in normal, visual, and insert modes using vim.keymap.set
vim.keymap.set({ 'n', 'i', 'v' }, 'jk', '<Esc>', { noremap = true, silent = true })

-- buffer management commands
vim.keymap.set('n', '<leader>bc', ':bd<CR>', { noremap = true, silent = true, desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>bw', ':w<CR>', { noremap = true, silent = true, desc = 'Write (save) current buffer' })
vim.keymap.set('n', '<leader>bb', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Switch to previous buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true, desc = 'Switch to next buffer' })
local telescope_builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>bl', telescope_builtin.buffers, { desc = 'Find existing buffers' })
--- do :w file.txt to save a new buffer
vim.keymap.set('n', '<leader>be', ':enew<CR>', { noremap = true, silent = true, desc = 'Open a new buffer - enew' })
