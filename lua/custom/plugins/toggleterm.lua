return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<c-t>]],
    }
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    local function switch_to_float()
      vim.api.nvim_create_user_command('ToggleTermSwitchFloat', 'ToggleTerm dir=. direction=float', {})
    end
    local function switch_to_tab()
      vim.api.nvim_create_user_command('ToggleTermSwitchTab', 'ToggleTerm dir=. direction=tab', {})
    end
    local function switch_to_horizontal()
      vim.api.nvim_create_user_command('ToggleTermSwitchHorizontal', 'ToggleTerm dir=. direction=horizontal', {})
    end
    local function switch_to_vertical()
      vim.api.nvim_create_user_command('ToggleTermSwitchVertical', 'ToggleTerm size=40 dir=. direction=vertical', {})
    end

    switch_to_float()
    switch_to_tab()
    switch_to_horizontal()
    switch_to_vertical()

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

    local trim_spaces = true
    vim.keymap.set({ 'v', 'n' }, '<C-s>', function()
      require('toggleterm').send_lines_to_terminal('single_line', trim_spaces, { args = vim.v.count })
    end)
  end,
}
