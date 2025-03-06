local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

-- keymap('n', '<leader>ww', ':w<CR>', { desc = 'Save' }) -- save

-- Fix Copy and Paste
keymap('x', 'p', [["_dP]], opts)
keymap({ 'n', 'x' }, 'x', [["_x]], opts)

keymap('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

keymap('n', 'vig', 'ggVG')

keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

keymap('n', '<leader>\\', '<C-w>v', { desc = 'Split Window Vertically' })
keymap('n', '<leader>-', '<C-w>s', { desc = 'Split Window Horizontally' })
keymap('n', '<leader>wd', ':close<CR>', { desc = '[W]indow [Delete]' })

keymap('n', '<leader>fs', '<cmd>noautocmd w <CR>', { desc = '[F]ile [S]ave with no formatting' })

-- Diagnostic Navigation
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
keymap('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
keymap('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
keymap('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
keymap('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- Buffers
keymap('n', '<Tab>', '<cmd>bnext<CR>', opts)
keymap('n', '<S-Tab>', '<cmd>bprevious<CR>', opts)
keymap('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
keymap('n', '<leader>bd', function()
  Snacks.bufdelete()
end, { desc = 'Delete Buffer' })
keymap('n', '<leader>bo', function()
  Snacks.bufdelete.other()
end, { desc = 'Delete Other Buffers' })

keymap('n', '<leader>xK', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>xx', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
