return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },

    dashboard = {
      enabled = true,
      preset = {
        header = [[
        _   _        __      ___           
       | \ | |       \ \    / (_)          
       |  \| | ___  __\ \  / / _ _ __ ___  
       | . ` |/ _ \/ _ \ \/ / | | '_ ` _ \ 
       | |\  |  __/ (_) \  /  | | | | | | |
       |_| \_|\___|\___/ \/   |_|_| |_| |_|
        ]],
      },
    },

    indent = { enabled = true },
    input = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
}
