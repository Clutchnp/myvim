return {
	"nvim-treesitter/nvim-treesitter",
lazy = false,
branch = "main",
build = ":TSUpdate",
config = function ()
require'nvim-treesitter'.setup {

  auto_install = true,
  highlight = {
    enable = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "rust", "python", "markdown", "markdown_inline", "latex"  },    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
 indent = {
    enable = true
  }
}
end
}
