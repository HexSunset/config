local opts = { noremap=true, silent=true }

-- Window key
vim.keymap.set('n', ';', '<C-w>', opts)

-- Git
vim.keymap.set('n', '<leader>gg', ':G<CR>', opts)
vim.keymap.set('n', '<leader>gc', ':G commit<CR>', opts)
vim.keymap.set('n', '<leader>gp', ':G push<CR>', opts)
vim.keymap.set('n', '<leader>gf', ':G pull<CR>', opts)

-- Movement
vim.keymap.set('n', 'gj', 'G', opts)
vim.keymap.set('n', 'gk', 'gg', opts)
vim.keymap.set('n', 'gh', '0', opts)
vim.keymap.set('n', 'gl', '$', opts)
vim.keymap.set('n', 'gs', '^', opts)

vim.keymap.set('v', 'gj', 'G', opts)
vim.keymap.set('v', 'gk', 'gg', opts)
vim.keymap.set('v', 'gh', '0', opts)
vim.keymap.set('v', 'gl', '$', opts)
vim.keymap.set('v', 'gs', '^', opts)

-- Buffers
vim.keymap.set('n', '<leader>bd', ':bd<CR>', opts)
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)
vim.keymap.set('n', '<leader>bn', ':bn<CR>', opts)
vim.keymap.set('n', '<leader>bp', ':bp<CR>', opts)
vim.keymap.set('n', '<leader>bl', ':Buffers<CR>', opts)

-- File browsing
vim.keymap.set('n', '<leader>ff', ':Files<CR>', opts)
vim.keymap.set('n', '<leader>fg', ':GFiles<CR>', opts)

-- Config
vim.keymap.set('n', '<leader>cc', ':Files ~/.config/nvim/<CR>', opts) -- Vim config
vim.keymap.set('n', '<leader>co', ':GFiles ~/.config/<CR>', opts)     -- All configs

vim.keymap.set('n', '<leader>rr', ':source ~/.config/nvim/init.lua<CR>', opts) -- Vim config

-- Update
vim.keymap.set('n', '<leader>uu', ':PackerSync<CR>', opts)
