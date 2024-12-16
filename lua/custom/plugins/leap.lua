-- lualine setup
return {
  'ggandor/leap.nvim',
  dependencies = { 'tpope/vim-repeat' },
  config = function()
    vim.keymap.set('n', '<leader>j', '<Plug>(leap)', { noremap = true, silent = true, desc = 'Jump to' })
    -- vim.keymap.set('n', '<leader>J', '<Plug>(leap-backward)', { noremap = true, silent = true, desc = 'Jump to (backward)' })
    -- vim.keymap.set('n', '<leader>J', '<Plug>(leap-from-window)')
    -- vim.keymap.set({ 'x', 'o' }, '<leader>j', '<Plug>(leap-forward)')
  end,
}
