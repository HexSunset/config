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
keymap("", "<C-S-v>", '"+p', bind_opts)
keymap("", "<C-S-c>", '"+y', bind_opts)

-- Fzf stuff
keymap("n", "<leader>ff", ':Files<CR>', bind_opts)
keymap("n", "<leader>fg", ':GFiles<CR>', bind_opts)
keymap("n", "<leader>ss", ':Buffers<CR>', bind_opts)

-- Window movement
keymap("n", "<leader>h", ":wincmd h<CR>", bind_opts)
keymap("n", "<leader>j", ":wincmd j<CR>", bind_opts)
keymap("n", "<leader>k", ":wincmd k<CR>", bind_opts)
keymap("n", "<leader>l", ":wincmd l<CR>", bind_opts)
