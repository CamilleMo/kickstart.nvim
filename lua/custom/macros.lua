-- CUSTOM MACROS --
-----------------
---
--- file specific macros
local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
local enter = vim.api.nvim_replace_termcodes('<CR>', true, true, true)
local ctrl_a = vim.api.nvim_replace_termcodes('<C-a>', true, true, true)

--- global macros
vim.fn.setreg('q', 'ihello here!') --- example
vim.fn.setreg('d', 'lD') --- useless as it remplaces a two strokes vim command by a two strokes triggered macros. Delete the rest of the line preservign the current character.
vim.fn.setreg(
  'a',
  'G?^## '
    .. enter
    .. esc
    .. 'yyGo'
    .. esc
    .. 'plll'
    .. ctrl_a
    .. 'lllDi Action Name'
    .. esc
    .. 'o'
    .. enter
    .. '### Description'
    .. enter
    .. enter
    .. '### Notes'
    .. enter
    .. enter
    .. '---'
    .. esc
)

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
