return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',

    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    local kind_icons = {
      Text = '󰉿',
      Method = 'm',
      Function = '󰊕',
      Constructor = '',
      Field = '',
      Variable = '󰆧',
      Class = '󰌗',
      Interface = '',
      Module = '',
      Property = '',
      Unit = '',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰇽',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '󰊄',
      Copilot = '',
    }

    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
        return false
      end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match '^%s*$' == nil
    end

    cmp.setup.filetype({ 'sql' }, {
      sources = {
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
      },
    })

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        --   -- Select the [n]ext item
        --   ['<C-n>'] = cmp.mapping.select_next_item(),
        --   -- Select the [p]revious item
        --   ['<C-p>'] = cmp.mapping.select_prev_item(),
        --
        --   -- Scroll the documentation window [b]ack / [f]orward
        --   ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        --   ['<C-f>'] = cmp.mapping.scroll_docs(4),
        --
        --   -- If you prefer more traditional completion keymaps,
        --   -- you can uncomment the following lines
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = vim.schedule_wrap(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
          else
            fallback()
          end
        end),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        --
        ['<C-Space>'] = cmp.mapping.complete {},
        --
        --   -- Think of <c-l> as moving to the right of your snippet expansion.
        --   --  So if you have a snippet that's like:
        --   --  function $name($args)
        --   --    $body
        --   --  end
        --   --
        --   -- <c-l> will move you to the right of each of the expansion locations.
        --   -- <c-h> is similar, except moving you backwards.
        --   ['<C-l>'] = cmp.mapping(function()
        --     if luasnip.expand_or_locally_jumpable() then
        --       luasnip.expand_or_jump()
        --     end
        --   end, { 'i', 's' }),
        --   ['<C-h>'] = cmp.mapping(function()
        --     if luasnip.locally_jumpable(-1) then
        --       luasnip.jump(-1)
        --     end
        --   end, { 'i', 's' }),
        --
        --   -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --   --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        {
          name = 'lazydev',
          -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
          group_index = 0,
        },
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
          vim_item.menu = ({
            copilot = '[Copilot]',
            nvim_lsp = '[LSP]',
            luasnip = '[Snippet]',
            buffer = '[Buffer]',
            path = '[Path]',
          })[entry.source.name]
          return vim_item
        end,
      },
    }
  end,
}
