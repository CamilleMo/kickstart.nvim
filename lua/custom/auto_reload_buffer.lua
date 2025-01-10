-- Enable autoread
vim.opt.autoread = true
-- vim.opt.updatetime = 2000

-- Create an autocommand for checktime
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold' }, {
  pattern = '*',
  callback = function()
    vim.cmd 'checktime'
  end,
})
