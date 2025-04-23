local add, later = MiniDeps.add, MiniDeps.later
local map_leader = require("utils").map_leader

later(function()
  add({
    source = "kristijanhusak/vim-dadbod-ui",
    depends = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
    },
  })

  vim.g.db_ui_use_nerd_fonts = 1

  map_leader("n", "db", "<Cmd>DBUIToggle<CR>", "[D]ata[B]ase UI")
end)
