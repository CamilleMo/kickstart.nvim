# Neovim Configuration Improvement Plan

Rewritten 2026-06-11 after a full review of the config. Previous plan items that were completed (statusline/AI redundancy, lazy-lock audit, treesitter migration, obsidian notify, `vim.lsp.config('*')`) have been removed.

---

## 1. Actual Bugs — ✅ all fixed 2026-06-11

- [x] **`conform.lua`: invalid formatter name** — `'ruff format'` → `ruff_format`. Verified with conform that the formatter is now resolved and available.
- [x] **`conform.lua`: prettierd AND prettier both run** — added `stop_after_first = true` and replaced `lsp_format = false` with the valid `'never'` for typescript/typescriptreact.
- [x] **`nvim-lspconfig.lua`: `virtual_line = true` typo** — *choice: removed the line instead of fixing the spelling.* The `virtual_text` block below it is the carefully configured one (custom format function), so it is clearly the intended display; enabling `virtual_lines` too would show every diagnostic twice. A NOTE comment in the file documents how to opt into `virtual_lines` instead.
- [x] **`keymaps.lua`: Diff/DiffMain rework** — *choices made:*
  - One shared `diff_with_branch()` helper; `:Diff [branch]` now has an **optional** argument.
  - With no argument, the branch is **auto-detected**: `origin/HEAD` first, then a local `main`/`master`, falling back to `'main'`. So the no-arg form does the right thing both in your `main` repos and in this `master` one.
  - `:DiffMain` is **kept** as an alias (muscle memory) but now uses the same detection — it no longer breaks on master-based repos.
  - The mapping is fixed: `<leader>hm` (stray `>` removed, `<CR>` added) runs `:Diff`.
  - Bonus fixes while in there: the diff buffer gets the original's filetype (syntax in the diff), `bufhidden=wipe` (no buffer-name collision on the second run), the leading blank line from `:read` is deleted, and the path is computed relative to the repo root so `:Diff` works when cwd is a subdirectory.
  - Tested headlessly: `:Diff master` and `:Diff` (auto-detect) both produce the correct 2-window diff in this repo.
- [x] **`keymaps.lua`: `:Diff` completion** — now completes git branch names (local + remote, prefix-filtered) instead of shell commands.
- [x] **`obsidian.lua`: nil workspace path** — added `enabled = obsidian_vault ~= nil` so the spec is disabled outright when `OBSIDIAN_HOME` is unset, with a WARN-level notification. *Choice: also removed the "Obsidian Vault is set to: …" notification that fired on every single startup — success is the normal case and doesn't need announcing.*
- [x] **`options.lua`: custom `undodir`** — *choice: kept the custom location and added `vim.fn.mkdir(dir, 'p')`* rather than dropping the option: the dir exists and holds ~190 live undo files, so switching to the default would orphan existing history. The mkdir protects fresh machines.
- [x] **`keymaps.lua`: `<F3>` "does not work"** — rewrote both `<F2>`/`<F3>` to use `vim.fn.append()` instead of `o<esc>k`/`O<esc>j`: no insert-mode round-trip, so comment-leader continuation can't corrupt the inserted line (the likely cause of the breakage) and the cursor doesn't move.

## 2. Fragile / Risky

- [ ] **`extra_plugins_settings.lua:16`: `require('vim._core.ui2')`** — `vim._core` is a private, undocumented namespace; it can break or disappear on any Neovim update with no deprecation notice. Track the official `vim.ui` / `:help ui2` API and pin expectations, or wrap in `pcall` with a fallback so startup never breaks.
- [ ] **`deno_and_typescript.lua` is dead AND obsolete** — it is not required from `init.lua` and uses the removed lspconfig framework API (`require('lspconfig')`, `tsserver` name). The same deno-vs-tsserver root logic already exists (commented) in `lsp/ts_ls.lua`'s `root_dir`. Implement it there and delete this file.
- [ ] **`macros.lua` overwrites registers on every startup** — registers `q`, `d`, `a`, `c` get clobbered (`q` is literally an example macro `ihello here!`, and `d` is documented as "useless"). Keep only the macros actually used; consider `<leader>`-mappings instead of register pollution.
- [ ] **`codeium.lua`: plain-letter insert mappings** — `fg`/`ff`/`fd`/`fx`/`fc` in insert mode make Neovim pause after every `f` you type (waiting for `timeoutlen`) in words like "offer", "different". Consider `<C-...>` chords instead. Also `event = 'BufEnter'` could be `InsertEnter` (codeium is only useful in insert mode).
- [ ] **Quit hangs when Neovim was started without a file** (found 2026-06-11 while testing §1): `nvim --headless +qa!` blocks for ever when launched with no file argument, but exits in <0.3s with one. Pre-existing, not caused by the §1 fixes. Prime suspect: the snacks dashboard (it only opens on argument-less startup); codeium's background process is the alternative. Worth bisecting with `enabled = false` on each.

## 3. Dead Code & Cleanup

- [ ] **`init.lua`**: remove the kickstart ASCII banner and tutorial comments (lines 1–85) and the never-used commented `kickstart.plugins.*` requires — then delete the unused `lua/kickstart/plugins/` files (debug, indent_line, lint, gitsigns, neo-tree); only `kickstart/health.lua` is still relevant.
- [ ] **Colorscheme set twice, one theme unused** — `vim.cmd.colorscheme 'catppuccin'` runs in both `catppuccin.lua` and `init.lua:237`; keep one. `tokyonight.lua` is fully configured but never activated — remove it or keep it deliberately as a fallback (document which).
- [ ] **`none-ls.lua` does nothing** — loaded for python but no sources are configured (the opts block is commented out). Python is already covered by ruff LSP + conform. Delete the plugin or configure it.
- [ ] **`ts_ls.lua`**: ~90 lines of commented config around `return {}` — either adopt the config (the `root_dir` deno logic is worth keeping, see §2) or trim the file.
- [ ] **`tree-sitter.lua`**: delete the obsolete commented master-branch config (lines 8–58) — superseded by the 0.12/main-branch setup in `init.lua`.
- [ ] **`snacks.lua`**: ~250 of 385 lines are commented-out alternative config and keymaps. Keep the live config; the reference config is on GitHub.
- [ ] **`basedpyright_c.lua:28-48`**: pasted notes about `:LspInfo` replacements belong in `doc/`, not in an LSP config file.
- [ ] **Old "nvim 10" commented keymaps** in `nvim-lspconfig.lua:104-128` — superseded by the `gr*` mappings above them.
- [ ] **Repo root junk**: empty `package.json` (`{}`), `package-lock.json` and `node_modules/` serve no purpose for an nvim config — delete them (they're untracked/ignored already). Move `test_kulala.http` and `getting commits from the kickstarter project.md` into `doc/`.

## 4. Consistency & Naming

- [ ] **LSP config files**: `rust_analyser.lua` (British spelling, won't ever match upstream defaults; note `rust_analyzer` *would* inherit nvim-lspconfig defaults like root_markers). `basedpyright_c` same remark — the `_c` suffix opts out of upstream defaults; document that choice in the file if intentional.
- [ ] **Copy-pasted comments in `lsp/*.lua`**: gopls, rufflsp and rust_analyser all carry lua_ls's comment about ".luarc.json" root markers; rust_analyser even carries ruff's commented python root_markers. Clean up and add the real markers: gopls → `{ 'go.mod', 'go.work', '.git' }`, rust_analyser → `{ 'Cargo.toml', '.git' }`.
- [ ] **File naming**: `kuala.lua` is a misspelling of the plugin it configures (kulala) — rename to `kulala.lua`. Also `todo-comment.lua` (plugin is todo-comment**s**) vs `git-signs.lua` (plugin is gitsign**s**): pick the plugin's own name as the convention.
- [ ] **which-key groups are stale** (`which-key.lua:48-59`): `<leader>a` "[A]I [A]ssistant" group survives although avante was removed; `<leader>j` "[J]ump" points at commented-out hop mappings. Missing groups for `<leader>R` (kulala) and `<leader>x` (execute/lua).
- [ ] **Telescope keymaps still split**: `<leader>bl` and `<leader>gb` live in `keymaps.lua` while the rest are in `telescope.lua`. Note `keymaps.lua:49` does a top-level `require 'telescope.builtin'`, which forces telescope to load at startup and defeats its lazy spec.
- [ ] **Tab navigation**: `<leader>bt*` is 3+ keystrokes; consider `<M-n>/<M-p>` or `<leader>t*` (but `<leader>t` is currently the [T]oggle group — resolve that collision first).
- [ ] **Minor**: `<C-t>` normal-mode mapping desc says "Out of terminal" but it *opens* the terminal (`keymaps.lua:89`); macros.lua comment says register `j` but sets register `c`.

## 5. Options Polish (`options.lua`)

- [ ] Remove `vim.o.lazyredraw = true` (line 96) — deprecated, and known to conflict with modern UI plugins (noice/ui2-style redrawing).
- [ ] Remove redundant defaults: `hlsearch` and `incsearch` are already on by default in Neovim (lines 99–101); `completeopt` (line 110) is unused since blink.cmp manages its own menu.
- [ ] `vim.opt.path:append '**'` (line 90) can hang `:find`/`gf` in big repos (it recurses node_modules etc.) — consider scoping or accepting the trade-off knowingly.

## 6. Nice to Have

- [ ] **Pick a picker direction**: telescope is fully set up; snacks has a complete commented picker config ready to swap in. Decide once — running both configs as "active + aspirational comment" is the main source of file bloat.
- [ ] **blink.cmp**: switch `fuzzy.implementation` to `'prefer_rust_with_warning'` for faster matching; consider enabling the commented `friendly-snippets` dependency.
- [ ] **Incremental selection**: the old treesitter module is gone on the main branch, but flash.nvim's `S` (treesitter jump) already covers most of it — try it before adding anything new.
- [ ] **Check upstream moves**: `epwalsh/obsidian.nvim` is unmaintained — the community fork is `obsidian-nvim/obsidian.nvim`; codeium was rebranded (codeium.vim → windsurf.vim). Verify and migrate the plugin specs.
- [ ] **`lazy-lock.json` is gitignored** — that means plugin versions aren't pinned in the repo, so a fresh clone gets the latest of everything. Recommended: track the lock file; decide deliberately.
- [ ] **Docs**: `doc/keymaps.md` + `generate_docs.sh` exist — wire the script into the workflow (or a git hook) so keymap docs don't drift; split personal notes out of the kickstart `README.md`.
- [ ] **Quickfix**: `nvim-bqf` for a better quickfix window (you already navigate qf with `<M-j>/<M-k>`).
- [ ] **Yank history**: `yanky.nvim`, or snacks picker's `registers`/`undo` pickers if you adopt the snacks picker.

---

## Priority Order

1. ~~**High**: §1 bugs~~ ✅ done 2026-06-11
2. **High**: §2 fragile code — private API use and the codeium typing latency affect daily editing; also the new argument-less-quit hang
3. **Medium**: §3 dead-code sweep — one mechanical cleanup pass
4. **Medium**: §4 consistency (LSP files, which-key groups, naming)
5. **Low**: §5 options polish
6. **Low**: §6 nice-to-haves — decide the telescope-vs-snacks question first, it unblocks several others
