return {
  name = "shellsplit",
  dir = "~/.local/share/nvim/lazy/shellsplit/",
  cmd = "Shell",
  keys = {
    { "<leader>ts", desc = "Run shell command in split" },
  },
  config = function ()
  require("shellsplit").setup{}
  end
}
