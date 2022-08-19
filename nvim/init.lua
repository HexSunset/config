------------
-- EDITOR --
------------
local editor = vim.o
local global = vim.g
local cmd = vim.cmd

global.mapleader = " "

editor.number = true
editor.relativenumber = true
editor.cursorline = true

editor.background = 'dark'

editor.expandtab = true
editor.tabstop = 4
editor.shiftwidth = 4

editor.mouse = 'a'

editor.hidden = true
editor.title = true

editor.wildmenu = true
cmd("set completeopt=menu,menuone,noselect,preview")


-------------
-- PLUGINS --
-------------
require('plugins')

cmd("colorscheme gruvbox-material")


--------------
-- KEYBINDS --
--------------
local bind_opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Config
keymap("n", "<leader>oc", ":Files ~/.config/nvim/<CR>", bind_opts)
keymap("n", "<leader>lc", ":source ~/.config/nvim/init.lua<CR>", bind_opts)

-- Gitgutter toggle
keymap("n", "<leader>gg", ":GitGutterToggle<CR>", bind_opts)

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
keymap("", "H", "2B", bind_opts)
keymap("", "L", "2W", bind_opts)

keymap("", "gk", 'gg', bind_opts)
keymap("", "gj", 'G', bind_opts)
keymap("", "gh", '0', bind_opts)
keymap("", "gl", '$', bind_opts)
keymap("", "gs", '^', bind_opts)

keymap("", "gm", '%', bind_opts)

-- Terminal
keymap("n", "<leader>tt", ":terminal<CR>", bind_opts)
keymap("t", "<Esc>", "<C-\\><C-n>", bind_opts)

-- Window movement
keymap("n", ";", "<C-w>", bind_opts)

-- Update
keymap("n", "<leader>U", ":PackerSync<CR>", bind_opts)

-- rust-tools
local rt = require("rust-tools")

keymap("n", "<leader>rhs", "lua rt.inlay_hints.set()<CR>", bind_opts)
keymap("n", "<leader>rhu", "lua rt.inlay_hints.unset()<CR>", bind_opts)

keymap("n", "<leader>rr", "lua rt.runnables.runnables()<CR>", bind_opts)
