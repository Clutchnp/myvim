return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "pyright",
                "bashls",
            },
        })
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({})
        lspconfig.rust_analyzer.setup({})
        lspconfig.bashls.setup({})
    end,
}
