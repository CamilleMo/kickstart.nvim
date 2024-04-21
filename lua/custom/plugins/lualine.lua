-- lualine setup
local theme = require 'lualine.themes.onedark'
-- TODO: place these kind of plugins setup in a dedicated file
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
return {}
