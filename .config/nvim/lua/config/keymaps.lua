-- Navigate windows with Ctrl+hjkl
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })

-- Clear search highlights with Escape
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><Esc>")

-- Show diagnostics in location list
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics in location list" })

-- Exit terminal mode with double Escape
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
