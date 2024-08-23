return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    vim.g.codeium_disable_bindings = 1
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', 'fg', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })
    vim.keymap.set('i', 'ff', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true })
    vim.keymap.set('i', 'fd', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true })
    vim.keymap.set('i', 'fx', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true })
    vim.keymap.set('i', 'fc', function()
      return vim.fn['codeium#Complete']()
    end, { expr = true, silent = true })
    -- set statusline+=\{…\}%3{codeium#GetStatusString()} in lua
  end,
}
