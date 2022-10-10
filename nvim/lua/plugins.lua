local bootstrap = require('packer_bootstrap')
local bootstrap_value = bootstrap()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Justfile syntax highlighting and stuff
  use 'NoahTheDuke/vim-just'

  -- use { "catppuccin/nvim", as = "catppuccin" }
  use 'psliwka/vim-smoothie'

  use 'tanvirtin/monokai.nvim'
  use 'tpope/vim-surround'
  use 'junegunn/fzf.vim'
  use 'nvim-lua/plenary.nvim'
  --use "lukas-reineke/indent-blankline.nvim"

  --use 'sheerun/vim-polyglot'

  -- use 'ggandor/leap.nvim'
  use 'easymotion/vim-easymotion'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use 'neovim/nvim-lspconfig'
  --use 'habamax/vim-asciidoctor' -- NOTE: Does not behave
  use 'tpope/vim-fugitive'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if bootstrap_value then
    require('packer').sync()
  end
end)
