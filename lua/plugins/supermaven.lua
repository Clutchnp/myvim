local on_attach = function(_, bufnr)
  return { buffer = bufnr }
  end
return {
      "supermaven-inc/supermaven-nvim",
      config = function()
    require("supermaven-nvim").setup({
      on_attach = on_attach,
      keymaps = {
        accept_suggestion = "<Right>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = {"txt"} , -- or { "cpp", }
      color = {
        suggestion_color = "#ffffff",
        cterm = 244,
      },
      log_level = "info", -- set to "off" to disable logging completely
      disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false, -- disables built in keymaps for more manual control
      condition = function()
        return false
      end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
    })
  end
}
