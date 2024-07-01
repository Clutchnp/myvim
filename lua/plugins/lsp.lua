--servers with default setups
local on_attach = function(_, bufnr)
    return {buffer = bufnr}
  end
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local def_servers = {
                "lua_ls",
                "pyright",
                "bashls",
}
-- defining setup fn for tables with default setups
    local lspsetup = function(server)
        local lspconfig = require("lspconfig")
        lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,

  })
    end
return {
   "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            -- here I am merging tables with default and non default setups using unpack
---@diagnostic disable-next-line: deprecated
                ensure_installed = {unpack(def_servers),"rust_analyzer",}
        })

--calling the setup fn 
        for _,server in ipairs(def_servers) do
        lspsetup(server)
        --lspconfig.lua_ls.setup({})
        --lspconfig.rust_analyzer.setup({})
        --lspconfig.bashls.setup({})
        end
        local lspconfig = require("lspconfig")
        local util = require "lspconfig/util"
        lspconfig.rust_analyzer.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = {"rust"},
          root_dir = util.root_pattern("Cargo.toml"),
          settings = {
            ['rust_analyzer'] = {
            cargo = {
              allFeatures = true,
          }
        }

      }
    })
    end,
}
