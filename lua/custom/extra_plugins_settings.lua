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

require('vim._core.ui2').enable {
  enable = true, -- Whether to enable or disable the UI.
  msg = { -- Options related to the message module.
    ---@type 'cmd'|'msg' Default message target, either in the
    ---cmdline or in a separate ephemeral message window.
    ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
    ---or table mapping |ui-messages| kinds and triggers to a target.
    targets = 'cmd',
    cmd = { -- Options related to messages in the cmdline window.
      height = 0.5, -- Maximum height while expanded for messages beyond 'cmdheight'.
    },
    dialog = { -- Options related to dialog window.
      height = 0.5, -- Maximum height.
    },
    msg = { -- Options related to msg window.
      height = 0.5, -- Maximum height.
      timeout = 4000, -- Time a message is visible in the message window.
    },
    pager = { -- Options related to message window.
      height = 1, -- Maximum height.
    },
  },
}
