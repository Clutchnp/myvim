--servers with default setups
local on_attach = function(_, bufnr)
  return { buffer = bufnr }
end
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local def_servers = {
  "lua_ls",
  "pyright",
  "bashls",
}
--servers to be manually configured
local man_servers = {
  "rust_analyzer", "gopls", "texlab","typst_lsp","hyprls"
}
--defining all server i.e. ones with defualt setup + manual setup eg. rust
---@diagnostic disable-next-line: deprecated
local all_servers = { unpack(def_servers) }

--add man_servers to def_servers
for _, manserver in ipairs(man_servers) do
  table.insert(all_servers, manserver)
end
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
      ensure_installed = all_servers
    })

    --calling the setup fn
    for _, server in ipairs(def_servers) do
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
      filetypes = { "rust" },
      root_dir = util.root_pattern("Cargo.toml"),
      settings = {
        ['rust_analyzer'] = {
          cargo = {
            allFeatures = true,
          }
        }

      }
    })
    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    })
    lspconfig.texlab.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {"tex", "plaintex", "bib"},
    })

    lspconfig.typst_lsp.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = function(fname) return util.path.dirname(fname) end,
      settings = {
        experimentalFormatterMode = "on"
      },
      })
  lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {"c", "cpp"},
    })
    lspconfig.hyprls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "hyprls" },
      pattern = {"*.hl","hypr*.conf"},
      root_dir = util.root_pattern(".git"),
    })
  end,
}
