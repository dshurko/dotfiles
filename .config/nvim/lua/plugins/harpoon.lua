local add, later = MiniDeps.add, MiniDeps.later
local map_leader = require("utils").map_leader

later(function()
  add({
    source = "ThePrimeagen/harpoon",
    checkout = "harpoon2",
    depends = { "nvim-lua/plenary.nvim" },
  })

  local harpoon = require("harpoon")

  harpoon:setup()

  map_leader("n", "a", function()
    harpoon:list():add()
  end, "[A]dd to harpoon")
  map_leader("n", "e", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, "Harpoon [E]xplorer")

  map_leader("n", "j", function()
    harpoon:list():select(1)
  end, "Harpoon mark [j]")
  map_leader("n", "k", function()
    harpoon:list():select(2)
  end, "Harpoon mark [k]")
  map_leader("n", "l", function()
    harpoon:list():select(3)
  end, "Harpoon mark [l]")
  map_leader("n", ";", function()
    harpoon:list():select(4)
  end, "Harpoon mark [;]")

  map_leader("n", "n", function()
    harpoon:list():next()
  end, "Harpoon [N]ext mark")
  map_leader("n", "p", function()
    harpoon:list():prev()
  end, "Harpoon [P]revious mark")
end)
