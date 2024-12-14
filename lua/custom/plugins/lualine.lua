-- lualine setup
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local theme = require 'lualine.themes.onedark'
    require('lualine').setup {
      options = {
        icons_enabled = false,
        theme = theme,
        component_separators = '|',
        section_separators = '',
      },
      tabline = {
        lualine_a = { 'buffers' },
        lualine_z = { 'tabs' },
      },
    }
  end,
}
