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

cmd("colorscheme gruvbox-material")


-------------
-- PLUGINS --
-------------
require('plugins')

--------------
-- KEYBINDS --
--------------
local bind_opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Config
keymap("n", "<leader>oc", ":Files ~/.config/nvim/<CR>", bind_opts)
keymap("n", "<leader>rc", ":source ~/.config/nvim/init.lua<CR>", bind_opts)

-- Saving
keymap("", "<C-s>", ":w<CR>", bind_opts)
keymap("i", "<C-s>", ":w<CR>", bind_opts)
keymap("n", "<leader>x", ":bd<CR>", bind_opts)

-- Copy paste
keymap("", "<C-p>", '"+p', bind_opts)
keymap("v", "<C-y>", '"+y', bind_opts)

-- Fzf stuff
keymap("n", "<leader>fp", ':Files<CR>', bind_opts)
keymap("n", "<leader>fh", ':History<CR>', bind_opts)
keymap("n", "<leader>rg", ':Rg<CR>', bind_opts)
keymap("n", "<leader>rl", ':Lines<CR>', bind_opts)
keymap("n", "<leader>rb", ':BLines<CR>', bind_opts)
keymap("n", "<leader>fg", ':GFiles<CR>', bind_opts)
keymap("n", "<leader>ss", ':Buffers<CR>', bind_opts)

-- Movement
keymap("", "J", "10j", bind_opts)
keymap("", "K", "10k", bind_opts)
keymap("", "H", "10h", bind_opts)
keymap("", "L", "10l", bind_opts)

keymap("", "gk", 'gg', bind_opts)
keymap("", "gj", 'G', bind_opts)
keymap("", "gh", '0', bind_opts)
keymap("", "gl", '$', bind_opts)
keymap("", "gs", '^', bind_opts)

-- Terminal
keymap("n", "<leader>tn", ":e term://fish<CR>", bind_opts)
keymap("n", "<leader>tv", ":vsplit term://fish<CR>", bind_opts)
keymap("n", "<leader>ts", ":split term://fish<CR>", bind_opts)

keymap("t", "<Esc>", "<C-\\><C-n>", bind_opts)

-- Window movement
keymap("n", ";", "<C-w>", bind_opts)

-- Update
keymap("n", "<leader>U", ":PackerSync<CR>", bind_opts)
