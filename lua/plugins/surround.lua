return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require('nvim-surround').setup({
        keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "<leader>s",
        normal_cur = "<leader>ss",
        normal_line = "<leader>S",
        normal_cur_line = "<leader>SS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
        change_line = "cS",
    },

    })
  end
}
