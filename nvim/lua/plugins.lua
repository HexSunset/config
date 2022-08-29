local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
	-- Manage itself :)
	use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

	use 'sainnhe/gruvbox-material'
    use { "catppuccin/nvim", as = "catppuccin" }

	use 'windwp/nvim-autopairs'

	use 'junegunn/fzf.vim'

    use 'preservim/nerdtree'

    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'

    use 'machakann/vim-sandwich'

    use 'psliwka/vim-smoothie'

    use 'nvim-lualine/lualine.nvim'

    use 'neovim/nvim-lspconfig'

    use 'godlygeek/tabular'
    use 'preservim/vim-markdown'

    use 'lukas-reineke/indent-blankline.nvim'

    -- CMP
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets"
    use 'saadparwaiz1/cmp_luasnip'
end)


---------------
-- LSPCONFIG --
---------------
require'lspconfig'.rust_analyzer.setup{}


--------------
-- NVIM-CMP --
--------------
require("configs.cmp")


----------------
-- CATPPUCCIN --
----------------
require("catppuccin").setup()


-------------
-- LUALINE --
-------------
require('lualine').setup {
    options = {
        theme = 'catppuccin'
    }
}
