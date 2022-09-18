require('plugins')
require('settings')
require('lsp-setup')
require('keybinds')

----------
-- LEAP --
----------
require('leap').set_default_keymaps()


----------------------
-- INDENT-BLANKLINE --
----------------------
require('indent_blankline').setup{}


--------------
-- NVIM-CMP --
--------------
require('cmp-setup')


-----------
-- THEME --
-----------
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()
vim.cmd [[colorscheme catppuccin]]
