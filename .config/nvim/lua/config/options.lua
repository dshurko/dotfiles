-- [[ Options ]]

-- Make line numbers default
vim.opt.number = true
-- Make relative line numbers default
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive search unless capitals are used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Display which-key popup sooner
vim.opt.timeoutlen = 300

-- Open new splits to the right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Display specific whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live as you type
vim.opt.inccommand = "split"

-- Highlight the current line
vim.opt.cursorline = true

-- Minimal lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- vim: ts=2 sts=2 sw=2 et
