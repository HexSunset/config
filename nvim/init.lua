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
cmd("set completeopt=noinsert,menuone,noselect")


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

-- Saving
keymap("", "<C-s>", ":w<CR>", bind_opts)
keymap("n", "<leader>x", ":bd<CR>", bind_opts)

-- Copy paste
keymap("n", "<leader>p", '"+p', bind_opts)
keymap("n", "<leader>P", '"+P', bind_opts)
keymap("v", "<leader>y", '"+y', bind_opts)
keymap("v", "<leader>Y", '"+Y', bind_opts)

-- Fzf stuff
keymap("n", "<leader>ff", ':Files<CR>', bind_opts)
keymap("n", "<leader>fg", ':GFiles<CR>', bind_opts)
keymap("n", "<leader>bs", ':Buffers<CR>', bind_opts)
