# Neovim Configuration Review & Enhancement Suggestions

This document provides a comprehensive review of your Neovim configuration with actionable suggestions for improvements in robustness, productivity, and maintainability.

---

## Table of Contents

1. [General Settings](#1-general-settings)
2. [File Layout & Organization](#2-file-layout--organization)
3. [LSP Configuration](#3-lsp-configuration)
4. [Plugin Configuration](#4-plugin-configuration)
5. [Keymaps & Productivity](#5-keymaps--productivity)
6. [Performance & Robustness](#6-performance--robustness)
7. [Quick Wins](#7-quick-wins)

---

## 1. General Settings

### Issues Found

#### 1.1 Duplicate `vim.o.confirm` Setting
**File:** `init.lua:170-175`

The `confirm` option is set twice:
```lua
vim.o.confirm = true  -- line 170
vim.o.confirm = true  -- line 175
```
**Recommendation:** Remove the duplicate.
Status: done

#### 1.2 Extreme `scrolloff` Value
**File:** `init.lua:166`

```lua
vim.o.scrolloff = 100
```
A value of 100 essentially keeps the cursor always centered, which can be disorienting when navigating large files.

**Recommendation:** Consider a value between 8-15 for a balance between context and screen real estate:
```lua
vim.o.scrolloff = 10
```

Status: done

#### 1.3 Missing Useful Options

Consider adding these commonly useful options:

```lua
-- Faster macros and screen updates
vim.o.lazyredraw = true

-- Better search experience
vim.o.hlsearch = true
vim.o.incsearch = true

-- Persistent undo across sessions (you have undofile, but consider undodir)
vim.o.undodir = vim.fn.stdpath('data') .. '/undo'

-- Disable swap files (optional, since you have undofile)
vim.o.swapfile = false

-- Better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- Show matching brackets
vim.o.showmatch = true

-- Reduce command line messages
vim.o.shortmess = vim.o.shortmess .. 'c'
```

---

## 2. File Layout & Organization

### Current Structure Analysis

Your current structure is reasonable but can be improved:

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lsp/                        # LSP server configs (Neovim 0.11+)
│   ├── basedpyright_c.lua
│   ├── gopls.lua
│   ├── lua_ls.lua
│   ├── rufflsp.lua
│   └── ts_ls.lua
└── lua/
    ├── custom/
    │   ├── auto_reload_buffer.lua
    │   ├── deno_and_typescript.lua
    │   ├── extra_plugins_settings.lua
    │   ├── keymaps.lua
    │   ├── macros.lua
    │   └── plugins/             # 20+ plugin configs
    └── kickstart/               # Original kickstart files
```

### Recommendations

#### 2.1 Consolidate Options into a Dedicated Module

Create `lua/custom/options.lua` to hold all `vim.o` / `vim.opt` settings:

```lua
-- lua/custom/options.lua
local M = {}

function M.setup()
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  vim.g.have_nerd_font = true

  -- All vim.o settings here...
end

return M
```

Then in `init.lua`:
```lua
require('custom.options').setup()
```

#### 2.2 Rename `extra_plugins_settings.lua`

This file only contains one line (`require('flash').toggle()`). Either:
- Rename it to `flash_settings.lua` or
- Move the line to `lua/custom/plugins/flash.lua` in its config function

#### 2.3 LSP Naming Inconsistency
**Files:** `lsp/basedpyright_c.lua`, `lsp/rufflsp.lua`

Your comment in `nvim-lspconfig.lua:44-50` explains the naming issue. Consider using the standard names to benefit from default configurations:
- `basedpyright_c.lua` -> `basedpyright.lua`
- `rufflsp.lua` -> `ruff.lua`

#### 2.4 Create an `autocmds.lua` File

Move all autocommands from various files into `lua/custom/autocmds.lua`:
- `TextYankPost` from `init.lua`
- `FileType http` from `keymaps.lua`
- `FocusGained`, `BufEnter`, `CursorHold` from `auto_reload_buffer.lua`
- `JSLogMacro` from `macros.lua`

This centralizes autocommand management.

---

## 3. LSP Configuration

### 3.1 TypeScript LSP is Commented Out
**File:** `lsp/ts_ls.lua`

The entire configuration is commented out, yet `ts_ls` is enabled in `nvim-lspconfig.lua:51`. This means TypeScript files get no LSP support since there's no actual configuration.

**Fix:** Either uncomment the configuration or provide a minimal one:
```lua
return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
}
```

### 3.2 Missing gopls `cmd`
**File:** `lsp/gopls.lua:4`

The `cmd` is commented out:
```lua
-- cmd = { 'gopls' },
```

This works because Neovim uses the default, but it's better to be explicit for clarity and debugging.

### 3.3 Consider Adding More LSPs

Based on your tech stack (Python, Go, TypeScript, Lua), you might benefit from:

```lua
-- JSON/YAML for configs
vim.lsp.enable { 'jsonls', 'yamlls' }

-- Bash for scripts
vim.lsp.enable { 'bashls' }

-- Docker
vim.lsp.enable { 'dockerls' }
```

### 3.4 Python LSP Overlap

You have both `basedpyright` and `ruff` attached to Python files. This is fine but clarify their roles:
- **basedpyright**: Type checking, intellisense, go-to-definition
- **ruff**: Linting and quick formatting

Consider disabling basedpyright's linting to avoid duplicate diagnostics:
```lua
-- In lsp/basedpyright_c.lua
settings = {
  basedpyright = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = 'openFilesOnly',
      useLibraryCodeForTypes = true,
      typeCheckingMode = 'standard',  -- or 'basic' for fewer diagnostics
    },
    -- Let ruff handle linting
    disableOrganizeImports = true,
  },
},
```

---

## 4. Plugin Configuration

### 4.1 Avante.nvim Conflicting Settings
**File:** `lua/custom/plugins/avante.lua:4-5`

```lua
event = 'VeryLazy',
lazy = false,  -- Contradicts VeryLazy
```

These settings conflict. `lazy = false` loads immediately, while `event = 'VeryLazy'` delays loading. Pick one strategy.
Status: to do

### 4.2 none-ls.nvim Has No Configuration
**File:** `lua/custom/plugins/none-ls.lua`

The plugin is loaded but has no actual configuration (opts function is commented out). Either configure it properly or remove it since you already have conform.nvim for formatting and ruff for linting.

**Recommendation:** Remove `none-ls.nvim` - it's redundant with your current setup.

Status: to do

### 4.3 Codeium + Avante + Copilot Overlap
**Files:** `codeium.lua`, `avante.lua`

You have:
- **Codeium**: AI completions
- **Avante**: AI chat (depends on Copilot)
- **Copilot**: AI completions (as avante dependency)

This creates potential conflicts. Consider:
1. Use only Codeium for inline completions OR
2. Use Copilot if you prefer it (Avante works better with it)

Status: do not do

### 4.4 Lualine Theme Mismatch
**File:** `lua/custom/plugins/lualine.lua:6`

```lua
local theme = require 'lualine.themes.onedark'
```

But your colorscheme is `catppuccin`. Use the matching theme:
```lua
local theme = 'catppuccin'
-- or
local theme = require 'lualine.themes.catppuccin'

```
Status: to do

### 4.5 Mini.statusline Conflicts with Lualine

You have both `mini.statusline` (in mini.lua) and `lualine.nvim` configured. They compete for the statusline.

**Recommendation:** Remove one. Since you have lualine configured with a tabline, keep lualine and remove mini.statusline:
```lua
-- In lua/custom/plugins/mini.lua
-- Comment out or remove:
-- local statusline = require 'mini.statusline'
-- statusline.setup { use_icons = vim.g.have_nerd_font }
```
Status: to do

### 4.6 Tree-sitter Textobjects Are Mostly Disabled
**File:** `lua/custom/plugins/tree-sitter-textobjects.lua`

Most of the powerful features are commented out. Consider enabling at least:

```lua
goto_next_start = {
  [']f'] = '@function.outer',
  [']c'] = '@class.outer',
},
goto_previous_start = {
  ['[f'] = '@function.outer',
  ['[c'] = '@class.outer',
},
```
Status: to do

These are extremely useful for code navigation.

### 4.7 Blink.cmp Could Use Rust Fuzzy Matcher
**File:** `lua/custom/plugins/blink.lua:93`

```lua
fuzzy = { implementation = 'lua' },
```

For better performance, consider:
```lua
fuzzy = { implementation = 'prefer_rust_with_warning' },

```
Status: to do

### 4.8 Snacks.nvim Has Many Disabled Features

You have commented out useful features in `snacks.lua`:
- `Snacks.scratch()` - Quick scratch buffers
- `Snacks.zen()` - Zen/focus mode
- `Snacks.notifier.show_history()` - Notification history

Consider enabling these for better productivity.

---

## 5. Keymaps & Productivity

### 5.1 Gitsigns `<leader>hu` Bug
**File:** `lua/custom/plugins/git-signs.lua:49`

```lua
map('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'git [u]ndo stage hunk' })
```

This is mapped to `stage_hunk` but described as "undo stage hunk". Fix:
```lua
map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
```
Status: to do

### 5.2 Tab Keymaps Could Be Simpler

Your tab navigation uses `<leader>bt*` which is 4 keystrokes. Consider:
```lua
vim.keymap.set('n', 'gt', ':tabnext<CR>')     -- Built-in, but explicit
vim.keymap.set('n', 'gT', ':tabprevious<CR>') -- Built-in, but explicit
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>')
```

### 5.3 Missing Useful Keymaps

Consider adding:

```lua
-- Center screen after movements
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Better paste (don't yank replaced text)
vim.keymap.set('x', '<leader>p', '"_dP')

-- Quick save
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>')

-- Select all
vim.keymap.set('n', '<C-a>', 'ggVG')

-- Split resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

```
Status: do not do

### 5.4 `jk` to Escape May Cause Typing Issues

Using `jk` for escape can interfere with typing words like "hijack". Consider using `jj` instead, which is less common in English:
```lua
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
```

Or use a timeout-based solution with `better-escape.nvim`.
Status: do not do

### 5.5 Codeium Keymaps Use `f*` Which May Conflict

**File:** `lua/custom/plugins/codeium.lua`

Using `fg`, `ff`, `fd`, `fx`, `fc` in insert mode may interfere with typing. Consider using `<C-*>` combinations:
```lua
vim.keymap.set('i', '<C-y>', function() return vim.fn['codeium#Accept']() end, { expr = true })
vim.keymap.set('i', '<C-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
vim.keymap.set('i', '<C-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
```
Status: to think, do not do for now

---

## 6. Performance & Robustness

### 6.1 Add Health Check

Create `lua/custom/health.lua`:

```lua
local M = {}

M.check = function()
  vim.health.start('Custom Configuration')

  -- Check for required executables
  local required = {
    'lua-language-server',
    'basedpyright-langserver',
    'gopls',
    'ruff',
    'stylua',
  }

  for _, exe in ipairs(required) do
    if vim.fn.executable(exe) == 1 then
      vim.health.ok(exe .. ' found')
    else
      vim.health.warn(exe .. ' not found')
    end
  end

  -- Check for Nerd Font
  if vim.g.have_nerd_font then
    vim.health.info('Nerd Font enabled')
  else
    vim.health.info('Nerd Font disabled')
  end
end

return M
```


Then run `:checkhealth custom` to verify your setup.
Status: to improve, do not do for now

### 6.2 Lazy Load More Plugins

Several plugins load eagerly when they could be lazy:

```lua
-- flash.lua: already uses VeryLazy, good!
-- oil.lua: already uses keys trigger, good!

-- avante.lua: should lazy load
event = 'VeryLazy',
lazy = true,  -- Change from false

-- snacks.lua: Consider lazy loading some features
```
Status: redundant with a task at the beginning of the file, do not do for now

### 6.3 Add Error Handling to Custom Requires

**File:** `init.lua:331-338`

```lua
-- Current:
require 'custom.keymaps'
require 'custom.macros'

-- Better:
local function safe_require(module)
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify('Error loading ' .. module .. ': ' .. err, vim.log.levels.ERROR)
  end
end

safe_require('custom.keymaps')
safe_require('custom.macros')
safe_require('custom.auto_reload_buffer')
safe_require('custom.extra_plugins_settings')

```
Status: to do

### 6.4 Snacks Global Variable

**File:** `lua/custom/plugins/snacks.lua:200`

```lua
Snacks = require 'snacks'
```

This creates a global. Better practice:
```lua
_G.Snacks = require 'snacks'
-- or use it locally within the init function
```

---

## 7. Quick Wins

Here are changes you can make immediately for better productivity:

### 7.1 Fix the Theme Consistency
```lua
-- In lualine.lua, change:
theme = 'catppuccin'
```

### 7.2 Remove Duplicate Code
- Remove duplicate `vim.o.confirm` in init.lua
- Remove none-ls.nvim (redundant)
- Remove either mini.statusline or lualine

### 7.3 Fix TypeScript LSP
Uncomment or provide minimal config in `lsp/ts_ls.lua`

### 7.4 Fix Gitsigns Undo Bug
Change `gitsigns.stage_hunk` to `gitsigns.undo_stage_hunk` for `<leader>hu`

### 7.5 Enable Tree-sitter Navigation
Uncomment `]f`, `[f`, `]c`, `[c` in tree-sitter-textobjects.lua

### 7.6 Add Centered Scrolling
```lua
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
```

---

## Summary

Your configuration is well-structured and uses modern Neovim practices (Neovim 0.11+ LSP management, lazy.nvim, blink.cmp). The main areas for improvement are:

1. **Consistency**: Theme mismatch, duplicate settings, conflicting lazy-loading
2. **LSP**: TypeScript config is empty, gopls cmd commented out
3. **Cleanup**: Remove redundant plugins (none-ls, one of the statuslines)
4. **Features**: Enable more tree-sitter textobjects for navigation
5. **Robustness**: Add health checks and error handling

Implementing even a few of these suggestions will make your configuration more robust and productive.

---

## 8. Implementation Checklist

Track progress on implementing the suggested enhancements. Update status to `done` when completed.

| ID | Task | File(s) | Status |
|----|------|---------|--------|
| 1.1 | Remove duplicate `vim.o.confirm` setting | `init.lua` | done |
| 1.2 | Reduce `scrolloff` from 100 to 10-15 | `init.lua` | done |
| 2.2 | Move `require('flash').toggle()` to flash.lua config | `extra_plugins_settings.lua`, `flash.lua` | todo |
| 2.3 | Rename LSP files to standard names (`basedpyright.lua`, `ruff.lua`) | `lsp/` | todo |
| 3.1 | Fix TypeScript LSP config (currently commented out) | `lsp/ts_ls.lua` | todo |
| 3.2 | Uncomment gopls `cmd` for explicitness | `lsp/gopls.lua` | todo |
| 4.1 | Fix avante.nvim conflicting lazy settings | `avante.lua` | todo |
| 4.2 | Remove none-ls.nvim (redundant with conform+ruff) | `none-ls.lua` | todo |
| 4.4 | Fix lualine theme to use catppuccin | `lualine.lua` | todo |
| 4.5 | Remove mini.statusline (conflicts with lualine) | `mini.lua` | todo |
| 4.6 | Enable tree-sitter textobjects navigation (`]f`, `[f`, `]c`, `[c`) | `tree-sitter-textobjects.lua` | todo |
| 4.7 | Switch blink.cmp fuzzy to `prefer_rust_with_warning` | `blink.lua` | todo |
| 5.1 | Fix gitsigns `<leader>hu` bug (wrong function) | `git-signs.lua` | todo |
| 5.3 | Add centered scrolling keymaps (`<C-d>zz`, `<C-u>zz`) | `keymaps.lua` | todo |
| 6.1 | Create health check file | `lua/custom/health.lua` | todo |
| 6.3 | Add `safe_require` wrapper for custom modules | `init.lua` | todo |
| 6.4 | Fix Snacks global variable (`_G.Snacks`) | `snacks.lua` | todo |
