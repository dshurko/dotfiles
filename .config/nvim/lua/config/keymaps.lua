local utils = require("utils")
local map, map_leader = utils.map, utils.map_leader

-- Window navigation
map("n", "<C-h>", "<C-w><C-h>", "Move left")
map("n", "<C-j>", "<C-w><C-j>", "Move down")
map("n", "<C-k>", "<C-w><C-k>", "Move up")
map("n", "<C-l>", "<C-w><C-l>", "Move right")

-- Search enhancements
map("n", "<Esc>", "<Cmd>nohlsearch<CR>", "Clear highlights")

-- Git integration
map_leader("n", "gg", "<Cmd>terminal lazygit<CR>i", "[G]it [G]UI (Lazygit)")
