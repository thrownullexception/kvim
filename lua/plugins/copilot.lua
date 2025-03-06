return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
  { 'AndreM222/copilot-lualine' },
  {
    'zbirenbaum/copilot-cmp',
    opts = {},
    config = function(_, opts)
      require('copilot_cmp').setup()
    end,
    specs = {
      {
        'hrsh7th/nvim-cmp',
        optional = true,
      },
    },
  },
}
