local opts = { noremap=true, silent=true }

-- Buffers
vim.keymap.set('n', '<leader>x', ':bd<CR>', opts)
vim.keymap.set('n', '<leader>n', ':bn<CR>', opts)
vim.keymap.set('n', '<leader>p', ':bp<CR>', opts)
vim.keymap.set('n', '<leader>bl', ':Buffers<CR>', opts)

-- File management
vim.keymap.set('n', '<leader>ff', ':Files<CR>', opts)
vim.keymap.set('n', '<leader>fg', ':GFiles<CR>', opts)
