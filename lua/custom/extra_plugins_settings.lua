require('flash').toggle() -- this activate flash when using regular search

local colors = require('catppuccin.palettes').get_palette()

vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { bold = true, fg = colors.base, bg = colors.blue })
vim.api.nvim_set_hl(0, 'MiniTablineVisible', { fg = colors.text, bg = colors.surface1 })
vim.api.nvim_set_hl(0, 'MiniTablineHidden', { fg = colors.overlay0, bg = colors.mantle })

vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { bold = true, fg = colors.base, bg = colors.peach })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { bold = true, fg = colors.peach, bg = colors.surface1 })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { bold = true, fg = colors.peach, bg = colors.mantle })

vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = colors.mantle })
vim.api.nvim_set_hl(0, 'MiniTablineTabpagesection', { bold = true, fg = colors.base, bg = colors.green })
