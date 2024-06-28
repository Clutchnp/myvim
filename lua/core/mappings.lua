vim.g.mapleader = " "
vim.keymap.set('n', '<leader>m', vim.cmd.Ex)
vim.keymap.set('n', 'fg', function() vim.cmd('Telescope find_files') end)
vim.keymap.set('n', 'ff', function() vim.cmd('Telescope live_grep') end)
vim.keymap.set('n', 'fb', function() vim.cmd('Telescope buffers') end)
vim.keymap.set('n', 'fh', function() vim.cmd('Telescope help_tags') end)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gl', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, {})


