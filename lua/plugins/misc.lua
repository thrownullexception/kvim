return {
  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  -- {
  --   -- High-performance color highlighter
  --   'norcalli/nvim-colorizer.lua',
  --   config = function()
  --     require('colorizer').setup()
  --   end,
  -- },
}
