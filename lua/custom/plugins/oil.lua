return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '-', '<cmd>Oil<cr>', desc = 'Open parent directory' },
  },
  config = function()
    require('oil').setup {
      view_options = {
        show_hidden = true,
      },
    }
  end,
}
