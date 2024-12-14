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
    terminal = {
      -- bo = {
      --   filetype = 'terminal',
      -- },
      -- wo = {},
      -- keys = {
      --   q = 'hide',
      --   gf = function(self)
      --     local f = vim.fn.findfile(vim.fn.expand '<cfile>', '**')
      --     if f == '' then
      --       Snacks.notify.warn 'No file under cursor'
      --     else
      --       self:hide()
      --       vim.schedule(function()
      --         vim.cmd('e ' .. f)
      --       end)
      --     end
      --   end,
      --   term_normal = {
      --     '<esc>',
      --     function(self)
      --       self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
      --       if self.esc_timer:is_active() then
      --         self.esc_timer:stop()
      --         vim.cmd 'stopinsert'
      --       else
      --         self.esc_timer:start(200, 0, function() end)
      --         return '<esc>'
      --       end
      --     end,
      --     mode = 't',
      --     expr = true,
      --     desc = 'Double escape to normal mode',
      --   },
      -- },
    },
  },
}
