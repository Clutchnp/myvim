return {
  dir = "~/.config/nvim/lua/plugins/template_picker/",
  config = function()
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"
    local conf = require("telescope.config").values
    local templates_dir = vim.fn.expand("~/.config/nvim/templates/")

    local function template_picker()
      local files = vim.fn.readdir(templates_dir)
      pickers.new({}, {
        prompt_title = "Templates",
        finder = finders.new_table {
          results = files,
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            if selection then
              vim.cmd("0r " .. templates_dir .. selection.value)
            end
          end)
          return true
        end,
      }):find()
    end

    vim.api.nvim_create_user_command("TemplatePicker", template_picker, {})

  end
}
