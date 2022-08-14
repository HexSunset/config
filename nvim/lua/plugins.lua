local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
	-- Manage itself :]
	use 'wbthomason/packer.nvim'

	use 'sainnhe/gruvbox-material'

	use 'jiangmiao/auto-pairs'

	use 'junegunn/fzf.vim'

    use 'preservim/nerdtree'

    use 'tpope/vim-fugitive'
    
    use 'machakann/vim-sandwich'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
end)


--------------
-- NVIM-CMP --
--------------
require('cmp-setup') -- Separate file because damn that shit messy
