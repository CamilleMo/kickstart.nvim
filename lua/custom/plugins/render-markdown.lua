-- Rich in-buffer markdown rendering (styled headings, drawn tables, bullets...)
-- https://github.com/MeanderingProgrammer/render-markdown.nvim
--
-- Kept dormant by default (enabled = false): obsidian.nvim ships its own markdown UI
-- and running both on vault notes would double-render. The cheatsheet float enables
-- it per-buffer. Run :RenderMarkdown buf_enable to turn it on in any markdown buffer.
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ft = 'markdown',
  opts = {
    enabled = false,
    render_modes = true, -- keep rendering in every mode (cheatsheet buffer is read-only anyway)
  },
}
