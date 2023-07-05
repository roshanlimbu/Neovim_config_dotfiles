local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use {
  --   'svrana/neosolarized.nvim',
  --   requires = { 'tjdevries/colorbuddy.nvim' }
  -- }
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'morhetz/gruvbox' -- Colorscheme
  use 'rafi/awesome-vim-colorschemes' -- buch of colorschemes
  
  -- COC plugins
  -- use {'neoclide/coc.nvim', branch = 'release'} -- For code Completion
  -- use {'fannheyward/coc-marketplace'} -- coc marketplace for extension

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'

   use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {'nvim-tree/nvim-tree.lua', commit = '9c97e6449b0b0269bd44e1fd4857184dfa57bb4c'}
  use 'goolord/alpha-nvim' -- alpha plugin
  use 'windwp/nvim-ts-autotag' -- auto-tag
  use 'akinsho/nvim-bufferline.lua' -- bufferline
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
} -- for comment usig 'gc'
  use 'folke/zen-mode.nvim' -- zen mode
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'nvim-tree/nvim-web-devicons'
  use 'akinsho/toggleterm.nvim'
  use 'lukas-reineke/indent-blankline.nvim' -- indent line 
  use 'folke/which-key.nvim' --Which-Key
  use 'ThePrimeagen/harpoon' -- harpoon
  use 'mbbill/undotree' -- undotree
  use 'tpope/vim-fugitive'
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- LSP
   use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
