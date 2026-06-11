# Neovim Configuration Improvement Plan

## Overview

This configuration is based on kickstart.nvim and has been extended with custom plugins and LSP configurations. Below are areas that could be improved.

> Status reviewed against the actual config on 2026-06-11.

---

## 1. Structure & Organization

### Issues
- Mixed kickstart and custom code in `init.lua` with commented-out sections
- `extra_plugins_settings.lua` has grown (flash toggle, MiniTabline highlights, ui2 config) - the flash one-liner still belongs in `flash.lua`
- Inconsistent file naming (e.g., `todo-comment.lua` vs `git-signs.lua`)

### Recommendations
- [ ] Clean up `init.lua` - remove kickstart boilerplate comments (intro banner and NOTE blocks still present)
- [ ] Move `require('flash').toggle()` from `extra_plugins_settings.lua` to `flash.lua` or delete (it runs at load time anyway)
- [ ] Standardize file naming: use consistent singular/plural (e.g., all `-signs.lua` or all `-sign.lua`)
- [ ] Remove unused files in `lua/kickstart/plugins/` if not being used (debug, indent_line, lint, gitsigns, neo-tree are all present but never required)

---

## 2. Plugin Redundancy

### Issues (resolved)
- ~~**Two statusline plugins**~~: lualine has been removed; `mini.statusline` is the only statusline now.
- ~~**Multiple AI assistants**~~: avante has been removed; only `codeium.vim` remains.
- ~~**nvim-cmp listed in lazy-lock but blink.cmp is used**~~: nvim-cmp is gone from `lazy-lock.json` along with avante.

### Recommendations
- [x] Choose one statusline: lualine removed, `mini.statusline` kept (commit `29051d2`)
- [x] Decide on one AI assistant: avante removed, codeium kept (commit `29051d2`)
- [x] Audit `lazy-lock.json` for unused plugins: `nvim-cmp`, `copilot.lua`, `lualine`, `avante` no longer in the lock file

---

## 3. LSP Configuration

### Issues
- Inconsistent LSP file naming: `rust_analyser.lua` (British spelling) but `basedpyright_c.lua` uses underscore
- `ts_ls.lua` contains extensive commented-out config - should either use it or simplify the file
- `gopls.lua` has commented-out defaults that are already the defaults
- Missing root_markers in `gopls.lua` (go.mod, go.sum should be added)

### Recommendations
- [ ] Standardize LSP file naming convention (`rust_analyser.lua` still has the British spelling)
- [ ] Clean up `ts_ls.lua` - keep the brief docstring or the full config, not both (still returns `{}` with ~90 lines of commented config)
- [ ] Add proper root_markers to `gopls.lua`: `{ 'go.mod', 'go.sum', 'go.work', '.git' }` (still commented out, and the comment shows python markers)
- [x] Consider adding `vim.lsp.config('*')` defaults for common settings across all LSPs (done in `nvim-lspconfig.lua`)

---

## 4. Keymaps Organization

### Issues
- Telescope keymaps split between `telescope.lua` and `keymaps.lua`
- Some keymaps have conflicting or unclear prefixes (e.g., `<leader>b` for buffers and tabs)
- `<leader>bt*` uses too many keystrokes for tab navigation (3 keypresses)

### Recommendations
- [ ] Consolidate plugin-specific keymaps in their plugin files, general keymaps in `keymaps.lua`
- [ ] Consider `<leader>t` for tabs, `<leader>b` strictly for buffers
- [ ] Add `<M-n>/<M-p>` for tab navigation as alternative to `<leader>btn`/`<leader>btt`
- [ ] Remove commented-out old Neovim 10 keymaps to reduce clutter

---

## 5. Treesitter Configuration

### Issues
- `tree-sitter.lua` is minimal with all useful config commented out (the old master-branch config is now obsolete since the 0.12/main-branch migration - could just be deleted)

### Recommendations
- [ ] Enable incremental selection in treesitter config (note: the new main branch of nvim-treesitter dropped this module - needs a different approach, e.g. `flash.nvim` treesitter mode or manual keymaps)
- [x] Consolidate parser installation configuration in one place: active install list lives only in `init.lua` now (the duplicate in `tree-sitter.lua` is commented out - delete it when cleaning up)
- [x] Consider adding `nvim-treesitter-textobjects`: added as `tree-sitter-textobjects.lua`

---

## 6. Code Quality & Best Practices

### Issues
- No filetype detection for non-standard files

### Recommendations
- [x] Replace `print()` with `vim.notify()` for better UX (done in `obsidian.lua`)
- [x] Add proper error handling for environment variables (`obsidian.lua` now checks `OBSIDIAN_HOME` and notifies if unset)
- [ ] Consider using `pcall` for plugin requires that might fail

---

## 7. Performance Optimizations

### Issues
- Some plugins use `event = 'VimEnter'` or `BufEnter` which loads earlier than necessary
- `lazyredraw` is enabled but deprecated in Neovim 0.10+

### Recommendations
- [ ] Review lazy-loading events for each plugin
- [ ] Remove `vim.o.lazyredraw = true` from `options.lua` (deprecated) - still present at `options.lua:96`
- [ ] Use `event = 'VeryLazy'` where appropriate

---

## 8. Missing Features

### Consider Adding
- [ ] **Snacks picker**: You have snacks.nvim but aren't using its picker. Could replace telescope for a more integrated experience.
- [ ] **Better quickfix**: `nvim-bqf` for enhanced quickfix window
- [ ] **Undo history**: `vim-visual-multi` or `nvim-ufo` for better fold/undo experience
- [ ] **Terminal improvements**: Toggle term or better terminal integration
- [ ] **Yank history**: `yanky.nvim` for yank history

---

## 9. Documentation

### Issues
- README has personal notes mixed with official kickstart docs
- No documentation for custom keymaps or macros

### Recommendations
- [ ] Add a KEYMAPS.md with your custom keybindings
- [ ] Separate personal notes from kickstart documentation
- [ ] Document the purpose of each LSP configuration file

---

## 10. Security & Maintenance

### Recommendations
- [x] Remove `node_modules/` from repository (in .gitignore, no longer tracked; the directory and `package.json`/`package-lock.json` still exist on disk untracked)
- [ ] Ensure `.env` and secrets are properly ignored
- [x] Keep `lazy-lock.json` in sync with actual plugins (now gitignored entirely - decide if that's intended, as it means plugin versions are no longer pinned in the repo)
- [ ] Run `:checkhealth` periodically to verify setup

---

## Priority Order

1. ~~**High**: Remove plugin redundancy (statusline, AI assistants)~~ ✅ done
2. **High**: Clean up `init.lua` and remove commented code
3. **Medium**: Consolidate keymaps
4. **Medium**: Fix LSP configurations
5. **Low**: Add missing features
6. **Low**: Documentation updates
