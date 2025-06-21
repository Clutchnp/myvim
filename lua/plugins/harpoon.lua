return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<leader>ja", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>jw", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>je", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>jr", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>js", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>jh", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>jl", function() harpoon:list():next() end)
  end
}
