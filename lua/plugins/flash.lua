return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  vscode = true,
  opts = {
    modes = {
      char = {
        jump_labels = true,
      },
    },
  },
  keys = {
    {
      's',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
  },
}
