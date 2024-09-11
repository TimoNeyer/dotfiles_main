require 'core.options'
require 'core.keymaps'
require 'core.snippets'


local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup ({
  require 'plugins.onedark',
  require 'plugins.neotree',
  require 'plugins.treesitter',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.telescope',
  require 'plugins.git',
  require 'plugins.autocomplete',
  require 'plugins.misc',
  require 'plugins.none-ls',
  require 'plugins.lsp'

})

vim.cmd('colorscheme onedark')
