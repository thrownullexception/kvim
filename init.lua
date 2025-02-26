require 'user.options'
require 'user.keymaps'
require 'user.autocommands'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.mini-ai',
  require 'plugins.lint',
  require 'plugins.comments',
  require 'plugins.flash',
  require 'plugins.lazydev',
  require 'plugins.autopairs',
  require 'plugins.gitsigns',
  require 'plugins.bufferline',
  require 'plugins.statusline',
  require 'plugins.whichkey',
  require 'plugins.dashboard',
  require 'plugins.theme',
  require 'plugins.autoformat',
  require 'plugins.autocomplete',
  require 'plugins.lsp',
  require 'plugins.treesitter',
  require 'plugins.search-and-replace',
  require 'plugins.persistence',
  require 'plugins.surround',
  require 'plugins.tmux',
  require 'plugins.misc',
  require 'plugins.dadbod',
  require 'plugins.copilot',
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
