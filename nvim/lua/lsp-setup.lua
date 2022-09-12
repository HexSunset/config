-- Disable inline warning messages
vim.diagnostic.config({
    virtual_text = false
})

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
