local opts = { noremap=true, silent=true }

-- Buffers
vim.keymap.set('n', '<leader>bd', ':bd<CR>', opts)
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)
vim.keymap.set('n', '<leader>bn', ':bn<CR>', opts)
vim.keymap.set('n', '<leader>bp', ':bp<CR>', opts)
vim.keymap.set('n', '<leader>bl', ':Buffers<CR>', opts)

-- File browsing
vim.keymap.set('n', '<leader>ff', ':Files<CR>', opts)
vim.keymap.set('n', '<leader>fg', ':GFiles<CR>', opts)

-- Update
vim.keymap.set('n', '<leader>uu', ':PackerSync<CR>', opts)
