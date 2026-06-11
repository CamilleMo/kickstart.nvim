-- Floating cheatsheet for the custom commands of this config (:Diff, <F2>/<F3>, macros...)
-- The content lives in doc/cheatsheet.md so it can be edited as plain markdown.
-- Open with :Cheatsheet, close with q or <Esc>.

local M = {}

M.path = vim.fn.stdpath 'config' .. '/doc/cheatsheet.md'

function M.open()
  if vim.fn.filereadable(M.path) == 0 then
    vim.notify('Cheatsheet file not found: ' .. M.path, vim.log.levels.ERROR)
    return
  end

  local buf = vim.api.nvim_create_buf(false, true) -- unlisted scratch buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.fn.readfile(M.path))
  vim.bo[buf].filetype = 'markdown'
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = 'wipe'

  -- centered float taking 75% of the editor in both dimensions
  local width = math.floor(vim.o.columns * 0.75)
  local height = math.floor(vim.o.lines * 0.75)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = 'minimal',
    border = 'rounded',
    title = ' Custom commands ',
    title_pos = 'center',
  })
  vim.wo[win].wrap = true

  -- rich rendered view via render-markdown.nvim, enabled only for this buffer
  -- (the plugin is configured dormant to not interfere with obsidian notes)
  local ok, render_markdown = pcall(require, 'render-markdown')
  if ok then
    render_markdown.buf_enable()
  else
    vim.wo[win].conceallevel = 2 -- fallback: at least hide the markup
  end

  for _, key in ipairs { 'q', '<Esc>' } do
    vim.keymap.set('n', key, '<cmd>close<CR>', { buffer = buf, desc = 'Close cheatsheet' })
  end
end

vim.api.nvim_create_user_command('Cheatsheet', M.open, { desc = 'Open the custom commands cheatsheet' })

return M
