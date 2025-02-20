return {
  'folke/snacks.nvim',
  opts = {
    lazygit = {},
  },

  keys = {
    {
      '<leader>gg',
      function()
        Snacks.lazygit.open()
      end,
      desc = 'Open LazyGit',
    },
  },
}
