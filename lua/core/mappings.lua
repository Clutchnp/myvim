-- Set mapleader to space
vim.g.mapleader = " "
-- Define key mappings
vim.keymap.set('n', "<leader>g", function() vim.cmd('NvimTreeToggle') end)
vim.keymap.set('n', '<Leader>fd', function() vim.cmd('Telescope git_files') end)
vim.keymap.set('n', '<Leader>fe', function() vim.cmd('Telescope find_files') end)
vim.keymap.set('n', '<Leader>ff', function() vim.cmd('Telescope live_grep') end)
vim.keymap.set('n', '<Leader>fl', function() vim.cmd('Telescope buffers') end)
vim.keymap.set('n', '<Leader>fh', function() vim.cmd('Telescope help_tags') end)
vim.keymap.set('n', '<Leader>fk', function() vim.cmd('Telescope current_buffer_fuzzy_find') end)
vim.keymap.set('x', '<F13>j', 'J')
vim.keymap.set({ 'n', 'x' }, 'J', 'j')
vim.keymap.set({ 'n', 'x' }, 'gh', '<C-o>')

local augroup = vim.api.nvim_create_augroup
local general = augroup('general', {})

local function close_qf_after_jump()
  if vim.bo.filetype == 'qf' then
    vim.cmd('cclose')
  end
end

vim.api.nvim_create_autocmd("BufLeave", {
  callback = close_qf_after_jump
})
vim.api.nvim_create_autocmd('LspAttach', {
  group = general,
  callback = function(e)
    local opts = { buffer = e.buf, nowait = true }
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover {border = "single"} end, opts)
    vim.keymap.set('n', 'gl', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'ga',  ":pop <CR>", opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>a', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d>", function() vim.diagnostic.goto_prev() end, opts)
    -- I have mapped f13 to my capslock key
    vim.keymap.set("n", 'zf', function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("n", "<Leader>bb", ':b#<CR>')
    vim.keymap.set('n', 's', 'ci')
    vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
    vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
    vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
    vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')
    vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
    vim.keymap.set('n', '<F13>', 'yi')
    vim.keymap.set({ "n", "v" }, "<leader>p", function() vim.cmd("PasteImage") end, opts)
  end
})
