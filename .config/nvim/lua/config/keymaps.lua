local utils = require("utils")
local map, map_leader = utils.map, utils.map_leader

-- Window movement
map("n", "<C-h>", "<C-w><C-h>", "Move to left window")
map("n", "<C-j>", "<C-w><C-j>", "Move to bottom window")
map("n", "<C-k>", "<C-w><C-k>", "Move to top window")
map("n", "<C-l>", "<C-w><C-l>", "Move to right window")

-- Clear search highlighting
map("n", "<Esc>", "<Cmd>nohlsearch<CR>", "Clear search highlights")

-- Terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Lazygit
map_leader("n", "gg", "<Cmd>terminal lazygit<CR>i", "[G]it [G]UI (Lazygit)")
