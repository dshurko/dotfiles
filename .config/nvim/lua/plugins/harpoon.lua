local add, later = MiniDeps.add, MiniDeps.later
local utils = require("utils")
local map, map_leader = utils.map, utils.map_leader

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
  map("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, "Harpoon [E]xplorer")

  map("n", "<C-j>", function()
    harpoon:list():select(1)
  end, "Harpoon file 1")
  map("n", "<C-k>", function()
    harpoon:list():select(2)
  end, "Harpoon file 2")
  map("n", "<C-l>", function()
    harpoon:list():select(3)
  end, "Harpoon file 3")
  map("n", "<C-;>", function()
    harpoon:list():select(4)
  end, "Harpoon file 4")

  map("n", "<C-n>", function()
    harpoon:list():next()
  end, "Harpoon [N]ext file")
  map("n", "<C-p>", function()
    harpoon:list():prev()
  end, "Harpoon [P]revious file")
end)
