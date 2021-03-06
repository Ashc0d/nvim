local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here --
  -- Packer (Required) --
  use {'wbthomason/packer.nvim'}

  -- Plugins used by other --
  -- Nvim-devicon plugin --
  use "kyazdani42/nvim-web-devicons"

  -- Main Plugins --
  -- lualine Plugin --

  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require('lualine').setup({
          options = {theme = 'powerline'}, -- powerline theme for lualine --
          extensions = {'nvim-tree'},
        })
      end,
  }

  -- Nvim-tree plugin --
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}-- optional, for file icon
  }

  -- coc.nvim plugin --
  use {'neoclide/coc.nvim', branch = 'release'}

  -- vim-surround --
  --  use {'tpope/vim-surround'}



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
