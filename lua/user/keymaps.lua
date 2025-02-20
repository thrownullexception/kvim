local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

keymap('x', 'p', [["_dP]], opts)
keymap({ 'n', 'x' }, 'x', [["_x]], opts)

keymap('n', '<Tab>', '<cmd>bnext<CR>', opts)
keymap('n', '<S-Tab>', '<cmd>bprevious<CR>', opts)
keymap('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

keymap('n', '<leader>\\', '<C-w>v', { desc = 'Split Window Vertically' })
keymap('n', '<leader>-', '<C-w>s', { desc = 'Split Window Horizontally' })
keymap('n', '<leader>wd', ':close<CR>', { desc = '[W]indow [Delete]' })

keymap('n', '<leader>fs', '<cmd>noautocmd w <CR>', { desc = '[F]ile [S]ave with no formatting' })

keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap('n', '<leader>xK', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>xx', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
