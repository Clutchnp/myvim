--servers with default setups
local def_servers = {
                "lua_ls",
                "rust_analyzer",
                "pyright",
                "bashls",
}
-- defining setup fn for tables with default setups
    local lspsetup = function(server)
        local lspconfig = require("lspconfig")
        lspconfig[server].setup({})
    end
return {
   "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
    },

    config = function()
        require("mason").setup()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup({
            -- here I am merging tables with default and non default setups using unpack
---@diagnostic disable-next-line: deprecated
                ensure_installed = {unpack(def_servers)}
        })

--calling the setup fn 
        for _,server in ipairs(def_servers) do
        lspsetup(server)
        capabilities = capabilities
        --lspconfig.lua_ls.setup({})
        --lspconfig.rust_analyzer.setup({})
        --lspconfig.bashls.setup({})
        end
    end,
}
