-- Enable autoread
vim.opt.autoread = true

-- Create an autocommand for checktime that excludes command-line window
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold' }, {
  pattern = '*',
  callback = function()
    -- Skip checktime in command-line window
    if vim.fn.getcmdwintype() == '' then -- prevent to run in the command line mode (q:, q/, q?)
      vim.cmd 'checktime'
    end
  end,
})

-- How checktime Refreshes Buffers
-- The checktime command works together with the autoread option to refresh buffers that have been modified externally. Here's how the process works:

-- vim.opt.autoread = true tells Neovim that it should automatically re-read files when they've been changed outside of the editor.
-- However, Neovim doesn't constantly check for external changes - it only performs this check at certain times.
-- The checktime command manually triggers this check for external modifications.
-- When checktime runs:
--
-- Neovim examines the timestamp and size of each loaded file
-- If it detects that a file has been modified externally since it was loaded or last checked
-- And if autoread is set
-- Then Neovim automatically reloads the file content from disk
--
-- Autocmd setup creates triggers for this check at strategic moments:
--
-- FocusGained: When Neovim regains focus (you switch back to it)
-- BufEnter: When you switch to a buffer
-- CursorHold: After cursor stays still for a period of time (controlled by updatetime)
--
-- This combination ensures buffers stay up-to-date with external changes without you having to manually reload them.
