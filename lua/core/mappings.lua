-- Set mapleader to space
vim.g.mapleader = ","
-- Define key mappings
vim.keymap.set('n', "<leader>,", function() vim.cmd('NvimTreeToggle') end)
vim.keymap.set('n', '<Leader>fd', function() vim.cmd('Telescope git_files') end)
vim.keymap.set('n', '<Leader>fe', function() vim.cmd('Telescope find_files') end)
vim.keymap.set('n', '<Leader>ff', function() vim.cmd('Telescope live_grep') end)
vim.keymap.set('n', '<Leader>fl', function() vim.cmd('Telescope buffers') end)
vim.keymap.set('n', '<Leader>fh', function() vim.cmd('Telescope help_tags') end)

vim.keymap.set({'n','x'}, '<F13>j', 'J')
vim.keymap.set('x', '<F13>j', 'J')
vim.keymap.set({'n','x'}, 'J', 'j')


local augroup = vim.api.nvim_create_augroup
local general = augroup('general', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = general,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'gl', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>a', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d>", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", '<F13>f', function() vim.lsp.buf.format() end, opts)
    vim.keymap.set('n', 's', 'ci')
    vim.keymap.set('n', '<F13>', 'yi')
    vim.keymap.set({ "n", "v"}, "<leader>p", function() vim.cmd("PasteImage") end, opts)
  end
})
