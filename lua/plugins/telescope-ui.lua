return {
'nvim-telescope/telescope-ui-select.nvim',
  -- Configuration function for setting up Telescope
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          -- Example: Using get_dropdown from themes
          require("telescope.themes").get_dropdown({
            -- Additional options for get_dropdown can be specified here
          }),
        },
      },
    })

    -- Load the ui-select extension after setup
    require("telescope").load_extension("ui-select")
  end
}
