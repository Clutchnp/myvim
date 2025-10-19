local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
  }
}

capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

local lsps = {
    { "rust_analyzer" },
    { "gopls" },
    { "ts_ls" },
    { "cssls" },
    { "lua_ls" },
    { "hls" },
    {"clangd"},
}

return {
  "neovim/nvim-lspconfig",
dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", -- note `.nvim`
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({})
for _, lsp in pairs(lsps) do
    local name, config = lsp[1], lsp[2]
    vim.lsp.enable(name)
    if config then
        vim.lsp.config(name, config)
    end
  end
end
}
