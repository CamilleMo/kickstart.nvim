# Vim/Neovim Usage Guide

A comprehensive guide to Vim motions, commands, and concepts. This is a companion to `keymaps.md` which documents custom keybindings.

---

## Modes

Vim operates in different modes:

| Mode | Description | How to Enter |
|------|-------------|--------------|
| **Normal** | Default mode for navigation and commands | `<Esc>` or `jk` (custom) |
| **Insert** | For typing text | `i`, `a`, `o`, `I`, `A`, `O` |
| **Visual** | For selecting text | `v`, `V`, `<C-v>` |
| **Command** | For Ex commands | `:` |
| **Replace** | For replacing text | `R` |

---

## Basic Movement

### Character Movement
| Key | Action |
|-----|--------|
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |

### Word Movement
| Key | Action |
|-----|--------|
| `w` | Move to start of next word |
| `W` | Move to start of next WORD (space-delimited) |
| `e` | Move to end of current/next word |
| `E` | Move to end of current/next WORD |
| `b` | Move to beginning of current/previous word |
| `B` | Move to beginning of current/previous WORD |
| `ge` | Move to end of previous word |
| `gE` | Move to end of previous WORD |

> **Note**: A "word" consists of letters, digits, and underscores. A "WORD" is any sequence of non-blank characters.

### Line Movement
| Key | Action |
|-----|--------|
| `0` | Move to beginning of line |
| `^` | Move to first non-blank character of line |
| `$` | Move to end of line |
| `g_` | Move to last non-blank character of line |
| `H` | Move to beginning of line (custom, remapped from `^`) |
| `L` | Move to end of line (custom, remapped from `$`) |

### Vertical Movement
| Key | Action |
|-----|--------|
| `gg` | Go to first line of file |
| `G` | Go to last line of file |
| `{number}G` | Go to line {number} |
| `{number}gg` | Go to line {number} |
| `%` | Jump to matching bracket/parenthesis |
| `{` | Jump to previous paragraph/block |
| `}` | Jump to next paragraph/block |
| `(` | Jump to previous sentence |
| `)` | Jump to next sentence |

### Screen Movement
| Key | Action |
|-----|--------|
| `<C-f>` | Page down (forward) |
| `<C-b>` | Page up (backward) |
| `<C-d>` | Half page down |
| `<C-u>` | Half page up |
| `<C-e>` | Scroll down one line |
| `<C-y>` | Scroll up one line |
| `zz` | Center cursor on screen |
| `zt` | Move cursor line to top of screen |
| `zb` | Move cursor line to bottom of screen |

> **Note**: Your config has `scrolloff=100`, which keeps the cursor centered.

---

## Operators

Operators perform actions on text. They combine with motions: `{operator}{motion}`

### Basic Operators
| Operator | Action |
|----------|--------|
| `d` | Delete |
| `c` | Change (delete and enter insert mode) |
| `y` | Yank (copy) |
| `>` | Indent right |
| `<` | Indent left |
| `=` | Auto-indent |
| `gU` | Make uppercase |
| `gu` | Make lowercase |
| `g~` | Toggle case |

### Operator + Motion Examples
| Command | Action |
|---------|--------|
| `dw` | Delete to start of next word |
| `d$` or `D` | Delete to end of line |
| `d0` | Delete to beginning of line |
| `dgg` | Delete to beginning of file |
| `dG` | Delete to end of file |
| `d}` | Delete to next paragraph |
| `cw` | Change word |
| `c$` or `C` | Change to end of line |
| `yy` | Yank entire line |
| `yw` | Yank word |
| `y$` | Yank to end of line |
| `>>` | Indent line right |
| `<<` | Indent line left |
| `==` | Auto-indent line |

### Double Operator (Line-wise)
| Command | Action |
|---------|--------|
| `dd` | Delete entire line |
| `cc` | Change entire line |
| `yy` | Yank entire line |
| `>>` | Indent line right |
| `<<` | Indent line left |

---

## Text Objects

Text objects define regions of text. Use with operators: `{operator}{a|i}{object}`

- `a` = "around" (includes delimiters/whitespace)
- `i` = "inside" (excludes delimiters/whitespace)

### Built-in Text Objects
| Object | Description |
|--------|-------------|
| `w` | Word |
| `W` | WORD |
| `s` | Sentence |
| `p` | Paragraph |
| `t` | HTML/XML tag |
| `"` | Double quotes |
| `'` | Single quotes |
| `` ` `` | Backticks |
| `(` or `)` or `b` | Parentheses |
| `[` or `]` | Square brackets |
| `{` or `}` or `B` | Curly braces |
| `<` or `>` | Angle brackets |

### Examples
| Command | Action |
|---------|--------|
| `diw` | Delete inside word |
| `daw` | Delete around word (includes surrounding space) |
| `ci"` | Change inside double quotes |
| `ca"` | Change around double quotes (includes quotes) |
| `dip` | Delete inside paragraph |
| `dap` | Delete around paragraph |
| `ci(` | Change inside parentheses |
| `da{` | Delete around curly braces |
| `yit` | Yank inside tag |
| `vat` | Visual select around tag |

### Tree-sitter Text Objects (Custom)
| Object | Description |
|--------|-------------|
| `af` | Around function |
| `if` | Inside function |
| `ac` | Around class |
| `ic` | Inside class |

---

## Insert Mode

### Entering Insert Mode
| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `I` | Insert at beginning of line |
| `a` | Append after cursor |
| `A` | Append at end of line |
| `o` | Open new line below |
| `O` | Open new line above |
| `s` | Substitute character (delete and insert) |
| `S` | Substitute line (delete line and insert) |
| `C` | Change to end of line |

### Insert Mode Commands
| Key | Action |
|-----|--------|
| `<C-h>` | Delete character before cursor (backspace) |
| `<C-w>` | Delete word before cursor |
| `<C-u>` | Delete to beginning of line |
| `<C-t>` | Indent line |
| `<C-d>` | Un-indent line |
| `<C-r>{reg}` | Insert contents of register |
| `<C-o>` | Execute one normal mode command |
| `jk` | Exit insert mode (custom) |

---

## Visual Mode

### Entering Visual Mode
| Key | Action |
|-----|--------|
| `v` | Character-wise visual |
| `V` | Line-wise visual |
| `<C-v>` | Block-wise visual |
| `gv` | Reselect last visual selection |

### Visual Mode Commands
| Key | Action |
|-----|--------|
| `o` | Move to other end of selection |
| `O` | Move to other corner (block mode) |
| `d` | Delete selection |
| `c` | Change selection |
| `y` | Yank selection |
| `>` | Indent selection |
| `<` | Un-indent selection |
| `~` | Toggle case |
| `u` | Make lowercase |
| `U` | Make uppercase |
| `J` | Move selection down (custom) |
| `K` | Move selection up (custom) |

---

## Search and Replace

### Search
| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor (forward) |
| `#` | Search word under cursor (backward) |
| `g*` | Search partial word under cursor (forward) |
| `g#` | Search partial word under cursor (backward) |

> **Note**: Your config has `ignorecase` and `smartcase` enabled. Search is case-insensitive unless you use uppercase letters.

### Replace (Substitute)
| Command | Action |
|---------|--------|
| `:s/old/new/` | Replace first occurrence in line |
| `:s/old/new/g` | Replace all occurrences in line |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all with confirmation |
| `:'<,'>s/old/new/g` | Replace in visual selection |

### Search Flags
| Flag | Description |
|------|-------------|
| `g` | Global (all occurrences) |
| `c` | Confirm each replacement |
| `i` | Case insensitive |
| `I` | Case sensitive |

> **Note**: Your config has `inccommand=split`, showing live preview of substitutions.

---

## Marks

### Setting Marks
| Key | Action |
|-----|--------|
| `m{a-z}` | Set local mark (buffer-specific) |
| `m{A-Z}` | Set global mark (across files) |

### Jumping to Marks
| Key | Action |
|-----|--------|
| `` `{mark} `` | Jump to exact position of mark |
| `'{mark}` | Jump to beginning of line containing mark |
| ``` `` ``` | Jump to position before last jump |
| `''` | Jump to line before last jump |
| `` `. `` | Jump to position of last edit |
| `'.` | Jump to line of last edit |

### Special Marks
| Mark | Description |
|------|-------------|
| `'<` | Start of last visual selection |
| `'>` | End of last visual selection |
| `'^` | Position of last insert |
| `'[` | Start of last change/yank |
| `']` | End of last change/yank |

---

## Registers

Registers are like clipboards. Access with `"{register}`.

### Using Registers
| Command | Action |
|---------|--------|
| `"{reg}y{motion}` | Yank into register |
| `"{reg}d{motion}` | Delete into register |
| `"{reg}p` | Paste from register |
| `"{reg}P` | Paste before from register |
| `:reg` | Show all registers |

### Special Registers
| Register | Description |
|----------|-------------|
| `"` | Default register (unnamed) |
| `0` | Last yank |
| `1-9` | Last deletes (history) |
| `+` | System clipboard |
| `*` | Primary selection (X11) |
| `_` | Black hole (discard) |
| `/` | Last search pattern |
| `:` | Last command |
| `.` | Last inserted text |
| `%` | Current filename |
| `#` | Alternate filename |
| `=` | Expression register |

> **Note**: Your config syncs the unnamed register with system clipboard (`clipboard=unnamedplus`).

---

## Undo and Redo

| Key | Action |
|-----|--------|
| `u` | Undo |
| `<C-r>` | Redo |
| `U` | Undo all changes on line |
| `.` | Repeat last change |

> **Note**: Your config has persistent undo enabled (`undofile=true`).

---

## Macros

### Recording and Playing Macros
| Key | Action |
|-----|--------|
| `q{a-z}` | Start recording macro to register |
| `q` | Stop recording |
| `@{a-z}` | Play macro from register |
| `@@` | Repeat last played macro |
| `{count}@{a-z}` | Play macro {count} times |

### Example Workflow
1. `qa` - Start recording to register `a`
2. Perform your edits
3. `q` - Stop recording
4. `@a` - Play the macro
5. `10@a` - Play 10 more times

---

## Jumps and Changes

### Jump List
| Key | Action |
|-----|--------|
| `<C-o>` | Go to older position in jump list |
| `<C-i>` | Go to newer position in jump list |
| `:jumps` | Show jump list |

### Change List
| Key | Action |
|-----|--------|
| `g;` | Go to older position in change list |
| `g,` | Go to newer position in change list |
| `:changes` | Show change list |

---

## File and Buffer Commands

### File Commands
| Command | Action |
|---------|--------|
| `:e {file}` | Edit file |
| `:w` | Write (save) |
| `:w {file}` | Write to file |
| `:q` | Quit |
| `:q!` | Quit without saving |
| `:wq` or `:x` | Write and quit |
| `:e!` | Reload file (discard changes) |
| `:saveas {file}` | Save as new file |

> **Note**: Your config has `confirm=true`, prompting to save instead of failing.

### Buffer Commands
| Command | Action |
|---------|--------|
| `:ls` or `:buffers` | List buffers |
| `:b {name/num}` | Switch to buffer |
| `:bn` | Next buffer |
| `:bp` | Previous buffer |
| `:bd` | Delete (close) buffer |
| `:e #` | Edit alternate buffer |

### Split and Windows
| Command | Action |
|---------|--------|
| `:sp {file}` | Horizontal split |
| `:vsp {file}` | Vertical split |
| `<C-w>s` | Split horizontal |
| `<C-w>v` | Split vertical |
| `<C-w>c` | Close window |
| `<C-w>o` | Close other windows |
| `<C-w>=` | Equal window sizes |
| `<C-w>_` | Maximize height |
| `<C-w>|` | Maximize width |
| `<C-w>h/j/k/l` | Navigate windows (also `<C-h/j/k/l>` custom) |

---

## Useful Ex Commands

| Command | Action |
|---------|--------|
| `:!{cmd}` | Execute shell command |
| `:r {file}` | Read file into buffer |
| `:r !{cmd}` | Read command output |
| `:{range}!{cmd}` | Filter through command |
| `:sort` | Sort lines |
| `:sort u` | Sort and remove duplicates |
| `:%!jq .` | Format JSON (using jq) |
| `:earlier {time}` | Go to earlier state (e.g., `:earlier 5m`) |
| `:later {time}` | Go to later state |
| `:noh` | Clear search highlight |

---

## Number Operations

| Key | Action |
|-----|--------|
| `<C-a>` | Increment number under cursor |
| `<C-x>` | Decrement number under cursor |
| `g<C-a>` | Increment numbers sequentially (visual) |
| `g<C-x>` | Decrement numbers sequentially (visual) |

---

## Folding

| Key | Action |
|-----|--------|
| `za` | Toggle fold |
| `zo` | Open fold |
| `zc` | Close fold |
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zj` | Move to next fold |
| `zk` | Move to previous fold |

---

## Miscellaneous

| Key | Action |
|-----|--------|
| `J` | Join lines |
| `gJ` | Join lines without space |
| `~` | Toggle case of character |
| `g~{motion}` | Toggle case |
| `gU{motion}` | Uppercase |
| `gu{motion}` | Lowercase |
| `<C-g>` | Show file info |
| `g<C-g>` | Show word/char count |
| `ga` | Show ASCII value of character |
| `gf` | Go to file under cursor |
| `gx` | Open URL under cursor |
| `K` | Show documentation (LSP hover) |

---

## Counts and Repetition

Most commands accept a count prefix:

| Example | Action |
|---------|--------|
| `5j` | Move down 5 lines |
| `3dw` | Delete 3 words |
| `2yy` | Yank 2 lines |
| `10@a` | Run macro `a` 10 times |
| `5.` | Repeat last change 5 times |

---

## Command-Line Tips

| Key | Action |
|-----|--------|
| `<C-p>` / `<C-n>` | Previous/next command history |
| `<Up>` / `<Down>` | Previous/next matching command |
| `<C-r><C-w>` | Insert word under cursor |
| `<C-r>%` | Insert current filename |
| `q:` | Open command-line window |
| `q/` | Open search history window |

---

## Quick Reference: Operator + Motion Combos

| Command | Mnemonic | Action |
|---------|----------|--------|
| `ciw` | Change inside word | Replace current word |
| `caw` | Change around word | Replace word + space |
| `ci"` | Change inside quotes | Replace quoted content |
| `dit` | Delete inside tag | Delete HTML tag content |
| `dap` | Delete around paragraph | Delete paragraph |
| `yiw` | Yank inside word | Copy word |
| `yi(` | Yank inside parentheses | Copy contents in () |
| `>ip` | Indent inside paragraph | Indent current paragraph |
| `gUiw` | Uppercase inside word | UPPERCASE word |

---

## Learning Path

1. **Start with basics**: `h`, `j`, `k`, `l`, `w`, `b`, `e`
2. **Learn operators**: `d`, `c`, `y` with motions
3. **Master text objects**: `iw`, `aw`, `i"`, `ip`, etc.
4. **Use the dot command**: `.` to repeat
5. **Record macros** for repetitive tasks
6. **Use registers** for advanced copy/paste
7. **Leverage marks** for navigation

---

*Companion to: keymaps.md*
*Configuration: kickstart.nvim*
