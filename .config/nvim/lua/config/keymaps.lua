local map = require("utils").map

--------------------------------------------------
-- Navigation
--------------------------------------------------
-- Window movement
map("n", "<C-h>", "<C-w><C-h>", "Move to left window")
map("n", "<C-j>", "<C-w><C-j>", "Move to bottom window")
map("n", "<C-k>", "<C-w><C-k>", "Move to top window")
map("n", "<C-l>", "<C-w><C-l>", "Move to right window")

--------------------------------------------------
-- UI
--------------------------------------------------
-- Clear search highlighting
map("n", "<Esc>", "<Cmd>nohlsearch<CR>", "Clear search highlights")

--------------------------------------------------
-- Mode-specific
--------------------------------------------------
-- Terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
