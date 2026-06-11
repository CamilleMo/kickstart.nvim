# Custom Commands Cheatsheet

Quick reference for the custom additions of this config.
Full keymap reference: `doc/keymaps.md` (or `<leader>sk` to search keymaps live).

## User Commands

| Command | Description |
| ------------------------- | ----------------------------------------------------------------- |
| `:Diff [branch]` | Diff current file against a branch (completes git branches) |
| `:Diff` | No argument: auto-detects the default branch (origin/HEAD) |
| `:DiffMain` | Alias of `:Diff` with the default branch |
| `:Cheatsheet` | This window (content lives in `doc/cheatsheet.md`) |
| `:RenderMarkdown buf_enable` | Rendered view for any markdown buffer |
| `:checkhealth vim.lsp` | The new `:LspInfo` — attached clients, root dirs, logs |

## Function Keys

| Key | Description |
| ----- | ------------------------------------------------------ |
| `<F2>` | Insert empty line **below** (stays in normal mode) |
| `<F3>` | Insert empty line **above** (stays in normal mode) |

## Startup Macros (`macros.lua`)

| Register | Where | Description |
| -------- | -------- | ------------------------------------------------------------ |
| `@c` | js/ts | `console.log('<word>:', <word>);` for the word under cursor |
| `@a` | markdown | Append an "Action" block (title, Description, Notes) |
| `@d` | anywhere | Delete rest of line, keep current character (`lD`) |

`<leader>xp` (visual) — send the selection to the snacks terminal.

## Editing & Navigation

| Key | Mode | Description |
| ------------- | ------ | ------------------------------------------------ |
| `jk` | insert | Escape |
| `H` / `L` | normal | Start / end of line |
| `J` / `K` | visual | Move selected lines down / up |
| `s` / `S` | normal | Flash jump / Flash treesitter selection |
| `gl` | normal | Line diagnostics in a float |
| `<M-j>` / `<M-k>` | normal | Next / previous quickfix (`<C-q>` in telescope fills the list) |
| `<C-t>` | normal | Toggle snacks terminal (same key exits terminal mode) |
| `-` | normal | Oil: open parent directory |

## Buffers & Tabs (`<leader>b`)

| Key | Description |
| ------------- | --------------------------------- |
| `<leader>bn` / `<leader>bb` | Next / previous buffer |
| `<leader>ba` | Alternate buffer (`:e #`) |
| `<leader>bl` | List buffers (telescope) |
| `<leader>bc` / `<leader>bw` | Close / write buffer |
| `<leader>bt…` | Tabs: `n`ew, nex`t`, `p`rev, `c`lose, `o`pen buffer in tab |

## Git (`<leader>g` and `<leader>h`)

| Key | Description |
| ------------- | ------------------------------------- |
| `<leader>gs` | Neogit status |
| `<leader>gc` / `gp` / `gP` | Neogit commit / pull / push |
| `<leader>gb` | Git branches (telescope) |
| `<leader>gB` | Blame current line |
| `<leader>gy` | Lazygit |
| `<leader>gl` / `<leader>gL` | Lazygit file history / cwd log |
| `]c` / `[c` | Next / previous hunk |
| `<leader>hs` / `hr` | Stage / reset hunk (also in visual) |
| `<leader>hm` | `:Diff` against the default branch |

## Codeium (insert mode)

| Key | Description |
| ---- | --------------------------- |
| `fg` | Accept suggestion |
| `ff` / `fd` | Next / previous suggestion |
| `fx` | Clear suggestion |
| `fc` | Trigger suggestion |

## Misc

| Key | Description |
| ------------- | ------------------------------------------------ |
| `<leader>f` | Format buffer (conform) |
| `<leader>sn` | Search files of this nvim config |
| `<leader>th` | Toggle inlay hints |
| `<leader>tL` | Toggle relative line numbers |
| `<leader>xl` / `<leader>xL` | Execute lua line/selection / whole file |
| `<leader>Rs` | Run HTTP request (kulala, `*.http` files) |
| `<leader>Q` | Force quit all (`:qa!`) |
| `:find <file>` | Recursive `path` is set: finds any file in the project |

Press `q` or `<Esc>` to close this window.
