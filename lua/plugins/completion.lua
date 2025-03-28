return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    "rafamadriz/friendly-snippets",
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require 'cmp'

-- Load VS Code-style snippets
    --
require('luasnip').filetype_extend('markdown', { 'tex' })
require("luasnip.loaders.from_vscode").lazy_load()
require("plugins.snippets.markdown")
    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
       require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),}),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },  -- For luasnip users.
        { name = 'buffer' },
        { name = 'path' },
      })
    })
  end

}
