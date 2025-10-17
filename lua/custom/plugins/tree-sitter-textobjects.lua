return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      textobjects = {
        -- Select textobjects
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- Functions
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            -- Classes
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            -- Conditionals (if statements)
            -- ['ai'] = '@conditional.outer',
            -- ['ii'] = '@conditional.inner',
            -- Loops
            -- ['al'] = '@loop.outer',
            -- ['il'] = '@loop.inner',
            -- Parameters/arguments
            -- ['aa'] = '@parameter.outer',
            -- ['ia'] = '@parameter.inner',
            -- Comments
            -- ['a/'] = '@comment.outer',
            -- ['i/'] = '@comment.inner',
            -- Blocks
            -- ['aB'] = '@block.outer',
            -- ['iB'] = '@block.inner',
            -- Function calls
            -- ['aC'] = '@call.outer',
            -- ['iC'] = '@call.inner',
            -- Returns
            -- ['ar'] = '@return.outer',
            -- ['ir'] = '@return.inner',
            -- Assignments
            -- ['a='] = '@assignment.outer',
            -- ['i='] = '@assignment.inner',
            -- ['l='] = '@assignment.lhs',
            -- ['r='] = '@assignment.rhs',
          },
          -- You can choose the select mode (default is charwise 'v')
          selection_modes = {
            -- ['@parameter.outer'] = 'v', -- charwise
            -- ['@function.outer'] = 'V', -- linewise
            -- ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in `ap`.
          include_surrounding_whitespace = false,
        },

        -- Move to next/previous textobject
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            -- [']f'] = '@function.outer',
            -- [']c'] = '@class.outer',
            -- [']a'] = '@parameter.inner',
            -- [']i'] = '@conditional.outer',
            -- [']l'] = '@loop.outer',
            -- [']b'] = '@block.outer',
            -- [']C'] = '@call.outer',
            -- [']r'] = '@return.outer',
          },
          goto_next_end = {
            -- [']F'] = '@function.outer',
            -- [']C'] = '@class.outer',
            -- [']A'] = '@parameter.inner',
            -- [']I'] = '@conditional.outer',
            -- [']L'] = '@loop.outer',
            -- [']B'] = '@block.outer',
          },
          goto_previous_start = {
            -- ['[f'] = '@function.outer',
            -- ['[c'] = '@class.outer',
            -- ['[a'] = '@parameter.inner',
            -- ['[i'] = '@conditional.outer',
            -- ['[l'] = '@loop.outer',
            -- ['[b'] = '@block.outer',
            -- ['[C'] = '@call.outer',
            -- ['[r'] = '@return.outer',
          },
          goto_previous_end = {
            -- ['[F'] = '@function.outer',
            -- ['[C'] = '@class.outer',
            -- ['[A'] = '@parameter.inner',
            -- ['[I'] = '@conditional.outer',
            -- ['[L'] = '@loop.outer',
            -- ['[B'] = '@block.outer',
          },
          -- Below will go to either the start or the end, whichever is closer.
          -- Use if you want more granular movements
          -- Make it even more gradual by adding multiple queries and regex.
          goto_next = {
            -- [']d'] = '@conditional.outer',
          },
          goto_previous = {
            -- ['[d'] = '@conditional.outer',
          },
        },

        -- Swap textobjects (useful for function parameters)
        swap = {
          enable = true,
          swap_next = {
            -- ['<leader>a'] = '@parameter.inner',
            -- ['<leader>f'] = '@function.outer',
          },
          swap_previous = {
            -- ['<leader>A'] = '@parameter.inner',
            -- ['<leader>F'] = '@function.outer',
          },
        },

        -- Peek definition of textobject
        lsp_interop = {
          enable = true,
          border = 'none',
          floating_preview_opts = {},
          peek_definition_code = {
            -- ['<leader>df'] = '@function.outer',
            -- ['<leader>dF'] = '@class.outer',
          },
        },
      },
    }
  end,
}
