-- CUSTOM MACROS --
-----------------
---
--- global macros
vim.fn.setreg('q', 'ihello here!') --- example
vim.fn.setreg('d', 'lD') --- useless as it remplaces a two strokes vim command by a two strokes triggered macros. Delete the rest of the line preservign the current character.

--- file specific macros
local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)

vim.api.nvim_create_augroup('JSLogMacro', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'JSLogMacro',
  pattern = { 'javascript', 'typescript' }, -- This will trigger for *.js and *.ts files
  callback = function()
    -- Create a macro in register 'j' that will:
    -- 1. Yank the word under cursor (yiw)
    -- 2. Insert console.log with the variable name and its value
    vim.fn.setreg('c', "yiwoconsole.log('" .. esc .. "pa:', " .. esc .. 'pa);' .. esc)
  end,
})
