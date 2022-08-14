------------
-- EDITOR --
------------
local global = vim.o
local cmd = vim.cmd

vim.g.mapleader = " "

global.number = true
global.relativenumber = true
global.cursorline = true

global.background = 'dark'

global.expandtab = true
global.tabstop = 4
global.shiftwidth = 4

global.mouse = 'a'

global.hidden = true
global.title = true

global.wildmenu = true
cmd("set completeopt=menu,menuone,noselect")


-------------
-- PLUGINS --
-------------
require('plugins')

-- Colorscheme
cmd("colorscheme gruvbox-material")


--------------
-- KEYBINDS --
--------------
local bind_opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Config
keymap("n", "<leader>oc", ":cd ~/.config/nvim/<CR>:Files<CR>", bind_opts)

-- Saving
keymap("", "<C-s>", ":w<CR>", bind_opts)
keymap("n", "<leader>x", ":bd<CR>", bind_opts)

-- Copy paste
keymap("", "<C-p>", '"+p', bind_opts)
keymap("v", "<C-y>", '"+y', bind_opts)

-- Fzf stuff
keymap("n", "<leader>fp", ':Files<CR>', bind_opts)
keymap("n", "<leader>fh", ':History<CR>', bind_opts)
keymap("n", "<leader>rg", ':Rg<CR>', bind_opts)
keymap("n", "<leader>fg", ':GFiles<CR>', bind_opts)
keymap("n", "<leader>ss", ':Buffers<CR>', bind_opts)

-- Movement
keymap("n", "gk", 'gg<CR>', bind_opts)
keymap("n", "gj", 'G<CR>', bind_opts)
keymap("n", "gh", '0<CR>', bind_opts)
keymap("n", "gl", '$<CR>', bind_opts)
keymap("n", "gs", '^<CR>', bind_opts)

keymap("v", "gk", 'gg<CR>', bind_opts)
keymap("v", "gj", 'G<CR>', bind_opts)
keymap("v", "gh", '0<CR>', bind_opts)
keymap("v", "gl", '$<CR>', bind_opts)
keymap("v", "gs", '^<CR>', bind_opts)
