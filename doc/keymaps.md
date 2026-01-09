# Neovim Custom Keybindings Reference

## Leader Keys Configuration
- **Leader Key**: `<Space>`
- **Local Leader Key**: `<Space>`

---

## General Keymaps

### Basic Navigation & Editing
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `<Esc>` | `:nohlsearch` | Clear search highlights |
| `i` | `jk` | `<Esc>` | Exit insert mode |
| `n` | `<leader>q` | Open diagnostic quickfix list | Open diagnostic [Q]uickfix list |

### Arrow Keys (Disabled for Training)
| Mode | Keymap | Action |
|------|--------|--------|
| `n` | `<left>` | Echo "Use h to move!!" |
| `n` | `<right>` | Echo "Use l to move!!" |
| `n` | `<up>` | Echo "Use k to move!!" |
| `n` | `<down>` | Echo "Use j to move!!" |

### Window Navigation
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `<C-h>` | `<C-w><C-h>` | Move focus to the left window |
| `n` | `<C-l>` | `<C-w><C-l>` | Move focus to the right window |
| `n` | `<C-j>` | `<C-w><C-j>` | Move focus to the lower window |
| `n` | `<C-k>` | `<C-w><C-k>` | Move focus to the upper window |

### Buffer Management
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `<leader>bc` | `:bd` | Close current buffer |
| `n` | `<leader>bw` | `:w` | Write (save) current buffer |
| `n` | `<leader>bb` | `:bprevious` | Switch to previous buffer |
| `n` | `<leader>bn` | `:bnext` | Switch to next buffer |
| `n` | `<leader>bl` | Telescope buffers | Find existing buffers |
| `n` | `<leader>ba` | `:e #` | Switch to alternate buffer |
| `n` | `<leader>be` | `:enew` | Open a new buffer |

### Tab Management
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `<leader>btn` | `:tabnew` | Create new tab |
| `n` | `<leader>btt` | `:tabnext` | Go to next tab |
| `n` | `<leader>btp` | `:tabprevious` | Go to previous tab |
| `n` | `<leader>btc` | `:tabclose` | Close current tab |
| `n` | `<leader>bt1` | `:tabfirst` | Go to first tab |
| `n` | `<leader>bt0` | `:tablast` | Go to last tab |
| `n` | `<leader>bt<` | `:-tabmove` | Move current tab to the left |
| `n` | `<leader>bt>` | `:+tabmove` | Move current tab to the right |
| `n` | `<leader>bto` | `:tab split` | Open current buffer in a new tab |
| `n` | `<leader>btl` | `:tabs` | List all tabs |

### Quickfix Navigation
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `<M-j>` | `:cnext` | Next quickfix item |
| `n` | `<M-k>` | `:cprevious` | Previous quickfix item |

### Git (Neogit & Git Branches)
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `<leader>gs` | `:Neogit` | Open Neogit |
| `n` | `<leader>gc` | `:Neogit commit` | Neogit commit |
| `n` | `<leader>gp` | `:Neogit pull` | Neogit pull |
| `n` | `<leader>gP` | `:Neogit push` | Neogit push |
| `n` | `<leader>gb` | Telescope git_branches | See git branches |
| `n` | `<leader>gB` | Git blame line (Snacks) | Git blame line |
| `n` | `<leader>gl` | Lazygit file history (Snacks) | Lazygit current file history |
| `n` | `<leader>gy` | Lazygit (Snacks) | Open Lazygit |
| `n` | `<leader>gL` | Lazygit log (Snacks) | Lazygit log (cwd) |

### LSP Helpers
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `gl` | Open line diagnostic float | Open diagnostic for current line |

### Miscellaneous
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `<leader>Q` | `:qa!` | Force quit all |
| `n` | `<leader>X` | Source current file | Execute the entire lua file |
| `v` | `<leader>x` | Execute lua selection | Execute selected lua lines |
| `n` | `<leader>x` | Execute current lua line | Execute lua line |
| `n` | `<F2>` | `o<esc>k` | Insert line below without entering insert mode |
| `n` | `<F3>` | `O<esc>j` | Insert line above without entering insert mode |

### Terminal
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `t` | `<C-t>` | `<C-\><C-n>` | Exit terminal mode |
| `n` | `<C-t>` | Toggle terminal (Snacks) | Toggle terminal |
| `t` | `<Esc><Esc>` (double tap) | Exit to normal mode | Snacks terminal - double escape to normal mode |
| `t` | `q` | Hide terminal | Snacks terminal - hide |
| `t` | `gf` | Open file under cursor | Snacks terminal - open file under cursor |

### Visual Mode Line Movement
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `v` | `J` | `:m '>+1<CR>gv=gv` | Move selected line(s) down |
| `v` | `K` | `:m '<-2<CR>gv=gv` | Move selected line(s) up |

---

## LSP Keymaps
*These keymaps are available when an LSP is attached to a buffer*

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `grn` | `vim.lsp.buf.rename` | Rename symbol |
| `n`, `x` | `gra` | `vim.lsp.buf.code_action` | Code action |
| `n` | `grr` | Telescope LSP references | Go to references |
| `n` | `gri` | Telescope LSP implementations | Go to implementation |
| `n` | `grd` | Telescope LSP definitions | Go to definition |
| `n` | `grD` | `vim.lsp.buf.declaration` | Go to declaration |
| `n` | `grt` | Telescope LSP type definitions | Go to type definition |
| `n` | `gO` | Telescope document symbols | Open document symbols |
| `n` | `gW` | Telescope workspace symbols | Open workspace symbols |
| `n` | `<leader>th` | Toggle inlay hints | Toggle inlay hints (if supported) |

---

## Telescope Keymaps

### Search Commands
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `<leader>sh` | Search help | Search help tags |
| `n` | `<leader>sk` | Search keymaps | Search keymaps |
| `n` | `<leader>sc` | Search commands | Search commands |
| `n` | `<leader>sf` | Find files | Search files |
| `n` | `<leader>ss` | Select Telescope | Search Telescope built-in pickers |
| `n` | `<leader>sw` | Search word | Search current word under cursor |
| `n` | `<leader>sg` | Live grep | Search by grep (live) |
| `n` | `<leader>sd` | Search diagnostics | Search diagnostics |
| `n` | `<leader>sr` | Resume | Resume last Telescope search |
| `n` | `<leader>s.` | Recent files | Search recent files |
| `n` | `<leader><leader>` | Buffers | Find existing buffers |
| `n` | `<leader>/` | Fuzzy find in buffer | Fuzzily search in current buffer |
| `n` | `<leader>s/` | Live grep in open files | Search in open files |
| `n` | `<leader>sn` | Search Neovim config | Search Neovim config files |

### Telescope Internal Keymaps
*Available when inside Telescope pickers*
- **Insert mode**: `<C-/>` - Show help
- **Normal mode**: `?` - Show help
- **Insert mode**: `<C-q>` - Send to quickfix list
- **Insert mode**: `<C-n>` / `<C-p>` - Next/Previous item
- **Insert mode**: `<Down>` / `<Up>` - Next/Previous item

---

## Flash (Motion/Jump) Keymaps

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n`, `x`, `o` | `s` | Flash jump | Jump to any visible location |
| `n`, `x`, `o` | `S` | Flash treesitter | Jump using treesitter |
| `o` | `r` | Remote flash | Remote flash |
| `o`, `x` | `R` | Treesitter search | Treesitter search |
| `c` | `<C-s>` | Toggle flash search | Toggle flash search in command mode |

---

## Git Signs Keymaps

### Git Hunk Navigation
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `]c` | Next git change | Jump to next git change |
| `n` | `[c` | Previous git change | Jump to previous git change |

### Git Hunk Actions
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `v` | `<leader>hs` | Stage hunk | Stage selected hunk (visual) |
| `v` | `<leader>hr` | Reset hunk | Reset selected hunk (visual) |
| `n` | `<leader>hs` | Stage hunk | Stage hunk |
| `n` | `<leader>hr` | Reset hunk | Reset hunk |
| `n` | `<leader>hS` | Stage buffer | Stage entire buffer |
| `n` | `<leader>hu` | Undo stage hunk | Undo stage hunk |
| `n` | `<leader>hR` | Reset buffer | Reset entire buffer |
| `n` | `<leader>hp` | Preview hunk | Preview hunk |
| `n` | `<leader>hb` | Blame line | Show git blame for line |
| `n` | `<leader>hd` | Diff against index | Show diff against index |
| `n` | `<leader>hD` | Diff against last commit | Show diff against last commit |

### Git Toggles
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `<leader>tb` | Toggle blame line | Toggle git blame line |
| `n` | `<leader>tD` | Toggle deleted lines | Toggle git show deleted |

---

## Oil (File Explorer) Keymaps

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `-` | Open Oil | Open parent directory in Oil |

---

## Mini.nvim Textobjects

### Mini.ai (Around/Inside Textobjects)
*Implicit keymaps from plugin - extends built-in text objects*

Examples:
- `va)` - Visually select around parentheses
- `yinq` - Yank inside next quote
- `ci'` - Change inside single quote
- Works with: `()`, `{}`, `[]`, `''`, `""`, tags, and more

### Mini.surround (Surround Operations)
| Mode | Keymap Pattern | Action | Description |
|------|----------------|--------|-------------|
| `n` | `sa{motion}{char}` | Add surround | Add surrounding (e.g., `saiw)` - surround word with parens) |
| `n` | `sd{char}` | Delete surround | Delete surrounding (e.g., `sd'` - delete quotes) |
| `n` | `sr{old}{new}` | Replace surround | Replace surrounding (e.g., `sr)'` - replace parens with quotes) |

Examples:
- `saiw)` - Surround word with parentheses
- `sd'` - Delete surrounding quotes
- `sr)'` - Replace parentheses with quotes

---

## Tree-sitter Textobjects

### Select Textobjects (Visual/Operator-pending modes)
| Keymap | Textobject | Description |
|--------|-----------|-------------|
| `af` | `@function.outer` | Around function |
| `if` | `@function.inner` | Inside function |
| `ac` | `@class.outer` | Around class |
| `ic` | `@class.inner` | Inside class |

*Note: Many other textobjects are commented out in the config but can be enabled*

Examples:
- `vaf` - Visually select around function
- `dif` - Delete inside function
- `yac` - Yank around class

---

## Codeium (AI Completion) Keymaps
*Available in Insert mode*

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `i` | `fg` | Accept completion | Accept Codeium suggestion |
| `i` | `ff` | Next completion | Cycle to next Codeium completion |
| `i` | `fd` | Previous completion | Cycle to previous Codeium completion |
| `i` | `fx` | Clear completion | Clear Codeium suggestion |
| `i` | `fc` | Complete | Trigger Codeium completion |

---

## Conform (Formatting) Keymaps

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n`, `v` | `<leader>f` | Format buffer | Format buffer or selection |

---

## Snacks Keymaps

### Snacks Toggle Keymaps
| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `<leader>tL` | Toggle relative number | Toggle relative line numbers |

---

## Blink.cmp (Completion) Keymaps
*Using 'default' preset - available in Insert mode*

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `i` | `<C-y>` | Accept completion | Accept completion ([y]es) |
| `i` | `<Tab>` / `<S-Tab>` | Navigate snippet | Move right/left in snippet expansion |
| `i` | `<C-Space>` | Open menu/docs | Open completion menu or docs |
| `i` | `<C-n>` / `<C-p>` | Select item | Select next/previous item |
| `i` | `<Up>` / `<Down>` | Select item | Select next/previous item |
| `i` | `<C-e>` | Hide menu | Hide completion menu |
| `i` | `<C-k>` | Toggle signature | Toggle signature help |

---

## Kulala (HTTP Client) Keymaps
*Only available in `.http` files*

| Mode | Keymap | Action | Description |
|------|--------|--------|-------------|
| `n` | `<leader>Rs` | Run HTTP request | Execute HTTP request (Kulala) |

---

## Which-Key Groups
*Prefix groups shown by which-key plugin*

- `<leader>a` - [A]I [A]ssistant
- `<leader>b` - [B]uffers and Ta[B]s
- `<leader>bt` - [T]abs
- `<leader>g` - [G]it and Neogit
- `<leader>h` - Git [H]unk (normal and visual mode)
- `<leader>j` - [J]ump
- `<leader>s` - [S]earch
- `<leader>t` - [T]oggle
- `gr` - LSP operations

---

## Notes

### Tips
1. Use `Ctrl+Q` in Telescope to populate the quickfix list
2. Use `:cdo` to execute commands on all quickfix items
3. Auto-format on save is enabled for most file types (except C/C++)
4. Clipboard is synced with system clipboard (`clipboard=unnamedplus`)
5. Mouse mode is enabled (`mouse=a`)

### Plugin-Provided Implicit Keymaps
Some plugins provide keymaps automatically without explicit configuration:
- **Avante** (AI assistant) - has its own default keymaps
- **Autopairs** - automatically pairs brackets, quotes, etc.
- **Obsidian.nvim** - provides Obsidian-specific commands (when in markdown files)

### LSP Document Highlights
When your cursor rests on a symbol, all references are automatically highlighted (if LSP supports it)

---

*Generated: 2025-10-23*
*Configuration: kickstart.nvim*
