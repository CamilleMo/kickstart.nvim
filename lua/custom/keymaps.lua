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

-- quickfix commands
-- do ctrl+q in telescope to populate the quickfix list
vim.keymap.set('n', '<M-j>', ':cnext<CR>', { noremap = true, silent = true, desc = 'Next quickfix' })
vim.keymap.set('n', '<M-k>', ':cprevious<CR>', { noremap = true, silent = true, desc = 'Previous quickfix' })
-- remember :cdo

-- code commands
-- vim.keymap.set('n', '<leader>cc', ':normal gcc<CR>', { noremap = true, silent = true, desc = '[C]ode [C]omment' })

-- neogit
vim.keymap.set('n', '<leader>gs', ':Neogit<CR>', { noremap = true, silent = true, desc = 'Open Neogit' })
vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { noremap = true, silent = true, desc = 'Neogit Commit' })
vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { noremap = true, silent = true, desc = 'Neogit pull' })
vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { noremap = true, silent = true, desc = 'Neogit push' })
vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', { noremap = true, silent = true, desc = 'Neogit see branches' })
-- vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { noremap = true, silent = true, desc = 'Open Neogit' })

-- custom code insertion
-- vim.keymap.set('n', '<leader>cid', ':read !date --iso-8601<CR>', { noremap = true, silent = true, desc = '[C]ode [I]nsert [D]ate' })
-- vim.keymap.set('n', '<leader>cit', ':read !date<CR>', { noremap = true, silent = true, desc = '[C]ode [I]nsert [T]imestamp' })

-- LSP helper
vim.keymap.set('n', 'gl', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', { noremap = true, silent = true, desc = 'LSP: [G]o to [L]ine diagnostic' })

-- misc
vim.keymap.set('n', '<leader>Q', ':qa!<CR>', { noremap = true, silent = true, desc = 'FORCE QUIT' })
vim.keymap.set('n', '<leader>X', '<cmd>source %<CR>', { noremap = true, silent = true, desc = 'Execute the entire lua file' })
vim.keymap.set('v', '<leader>x', ':lua<CR>', { noremap = true, silent = true, desc = 'Execute lua lines' })
vim.keymap.set('n', '<leader>x', ':.lua<CR>', { noremap = true, silent = true, desc = 'Execute lua line' })
vim.keymap.set('n', '<CR>', 'o<esc>k', { noremap = true, silent = true, desc = 'Insert a line below without entering insert mode' })
vim.keymap.set('n', '<C-CR>', 'O<esc>j', { noremap = true, silent = true, desc = 'Insert a line above without entering insert mode' }) -- this one does not work

-- terminal
vim.keymap.set('t', '<C-t>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Out of terminal' })
vim.keymap.set({ 'n' }, '<C-t>', ':lua Snacks.terminal.toggle()<CR>', { noremap = true, silent = true, desc = 'Out of terminal' })

-- hop
-- vim.keymap.set('n', '<leader>jj', ':HopChar2<CR>', { noremap = true, silent = true, desc = 'Hop with 2 chars' })
-- vim.keymap.set('n', '<leader>jw', ':HopWord<CR>', { noremap = true, silent = true, desc = 'Hop with word' })
-- vim.keymap.set('n', '<leader>jl', ':HopLine<CR>', { noremap = true, silent = true, desc = 'Hop with line' })

-- move lines up/down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = 'Move line up' })

-- tabs manipulation
-- Create a new tab
vim.keymap.set('n', '<leader>btn', ':tabnew<CR>', { noremap = true, silent = true, desc = '[T]ab [N]ew' })
-- Go to next tab
vim.keymap.set('n', '<leader>btt', ':tabnext<CR>', { noremap = true, silent = true, desc = '[T]ab nex[T]' })
-- Go to previous tab
vim.keymap.set('n', '<leader>btp', ':tabprevious<CR>', { noremap = true, silent = true, desc = '[T]ab [P]revious' })
-- Close current tab
vim.keymap.set('n', '<leader>btc', ':tabclose<CR>', { noremap = true, silent = true, desc = '[T]ab [C]lose' })
-- Go to first tab
vim.keymap.set('n', '<leader>bt1', ':tabfirst<CR>', { noremap = true, silent = true, desc = '[T]ab [1]st' })
-- Go to last tab
vim.keymap.set('n', '<leader>bt0', ':tablast<CR>', { noremap = true, silent = true, desc = '[T]ab last ([0])' })
-- Move current tab to the left
vim.keymap.set('n', '<leader>bt<', ':-tabmove<CR>', { noremap = true, silent = true, desc = '[T]ab move left' })
-- Move current tab to the right
vim.keymap.set('n', '<leader>bt>', ':+tabmove<CR>', { noremap = true, silent = true, desc = '[T]ab move right' })
-- Open current buffer in a new tab
vim.keymap.set('n', '<leader>bto', ':tab split<CR>', { noremap = true, silent = true, desc = '[T]ab [O]pen buffer' })
-- List all tabs
vim.keymap.set('n', '<leader>btl', ':tabs<CR>', { noremap = true, silent = true, desc = '[T]ab [L]ist' })

-- kulula - only for *.http files
-- https://neovim.getkulala.net/docs/getting-started/default-keymaps
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'http',
  callback = function()
    vim.keymap.set('n', '<leader>Rs', ':lua require("kulala").run()<CR>', { buffer = true, noremap = true, silent = true, desc = 'kulula' })
  end,
})
