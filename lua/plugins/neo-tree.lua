-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  -- keys = {
  --   { '<leader>e', ':Neotree reveal<CR>', desc = 'Toggle Explorer', silent = true },
  -- },
  opts = {
    window = {
      position = 'right',
    },
    filesystem = {
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
        },
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          '.git',
          '.DS_Store',
        },
        always_show = {
          '.env',
        },
      },
    },
  },
}
