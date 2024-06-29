-- Set mapleader to space
vim.g.mapleader = " "
-- Define key mappings
vim.keymap.set('n', '<leader>m', vim.cmd.Ex)
vim.keymap.set('n', 'fd', function() vim.cmd('Telescope git_files') end)
vim.keymap.set('n', 'fe', function() vim.cmd('Telescope find_files') end)
vim.keymap.set('n', 'ff', function() vim.cmd('Telescope live_grep') end)
vim.keymap.set('n', 'fl', function() vim.cmd('Telescope buffers') end)
vim.keymap.set('n', 'fh', function() vim.cmd('Telescope help_tags') end)
local augroup = vim.api.nvim_create_augroup
local general = augroup('general',{})
vim.api.nvim_create_autocmd('LspAttach',{
 group = general,
 callback = function(e)
    local opts = { buffer = e.buf }
vim.keymap.set('n', 'K',function() vim.lsp.buf.hover() end, opts)
vim.keymap.set('n', 'gl',function() vim.lsp.buf.definition() end, opts)
vim.keymap.set('n', 'gr',function() vim.lsp.buf.references() end, opts)
vim.keymap.set('n', 'ca',function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d>", function() vim.diagnostic.goto_prev() end, opts)
end
})


