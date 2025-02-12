return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "RchrdAriza/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local time = os.date("%H:%M")
        local date = os.date("%a %d %b")
        local v = vim.version()
        local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

        -- Set header
        dashboard.section.header.val = {
"⡏⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿",
"⣿⠀⠀⠀⠈⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠁⠀⣿",
"⣿⣧⡀⠀⠀⠀⠀⠙⠿⠿⠿⠻⠿⠿⠟⠿⠛⠉⠀⠀⠀⠀⠀⣸⣿",
"⣿⣿⣷⣄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿",
"⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣴⣿⣿⣿⣿",
"⣿⣿⣿⡟⠀⠀⢰⣹⡆⠀⠀⠀⠀⠀⠀⣭⣷⠀⠀⠀⠸⣿⣿⣿⣿",
"⣿⣿⣿⠃⠀⠀⠈⠉⠀⠀⠤⠄⠀⠀⠀⠉⠁⠀⠀⠀⠀⢿⣿⣿⣿",
"⣿⣿⣿⢾⣿⣷⠀⠀⠀⠀⡠⠤⢄⠀⠀⠀⠠⣿⣿⣷⠀⢸⣿⣿⣿",
"⣿⣿⣿⡀⠉⠀⠀⠀⠀⠀⢄⠀⢀⠀⠀⠀⠀⠉⠉⠁⠀⠀⣿⣿⣿",
"⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿",
"⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿",
  }
dashboard.section.buttons.val = {
            dashboard.button("n", "   New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "󰮗   Find file", ":cd $HOME | Telescope find_files<CR>"),
            dashboard.button("e", "   File Explorer", ":cd $HOME | NvimTreeOpen<CR>"),
            dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("c", "   Configuration", ":e ~/.config/nvim/lua/core/mappings.lua<CR>"),
            dashboard.button("R", "󱘞   Ripgrep", ":Telescope live_grep<CR>"),
            dashboard.button("q", "󰗼   Quit", ":qa<CR>"),
        }

        function CenterText(text, width)
            local totalPadding = width - #text
            local leftPadding = math.floor(totalPadding / 2)
            local rightPadding = totalPadding - leftPadding
            return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
        end

        dashboard.section.footer.val = {
            CenterText("The Fable does not end as long as someone is still reading.", 50),
            " ",
            -- centerText("NvimOnMy_Way❤️", 50),
            -- " ",
            CenterText(date, 60),
            CenterText(time, 60),
            CenterText(version, 62),
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
