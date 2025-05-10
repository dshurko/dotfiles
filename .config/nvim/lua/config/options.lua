--------------------------------------------------
-- Display and UI
--------------------------------------------------
-- Show line numbers
vim.opt.number = true
-- Show relative line numbers for easier navigation
vim.opt.relativenumber = true
-- Highlight the current line
vim.opt.cursorline = true
-- Keep signcolumn on by default (for git signs, diagnostics)
vim.opt.signcolumn = "yes"
-- Hide mode indicator since it's shown in statusline
vim.opt.showmode = false
-- Keep minimal lines visible above/below cursor
vim.opt.scrolloff = 10
-- Enable 24-bit RGB colors for modern themes
vim.opt.termguicolors = true

--------------------------------------------------
-- Editing Behavior
--------------------------------------------------
-- Enable mouse support in all modes
vim.opt.mouse = "a"
-- Sync clipboard with system clipboard
vim.opt.clipboard = "unnamedplus"
-- Maintain indentation on line wraps
vim.opt.breakindent = true
-- Default indentation: 2 spaces
vim.opt.shiftwidth = 2
-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Number of spaces a tab counts for
vim.opt.tabstop = 2
-- Case-insensitive search unless capitals are used
vim.opt.ignorecase = true
vim.opt.smartcase = true

--------------------------------------------------
-- Window and Buffer Management
--------------------------------------------------
-- Open new splits to the right and below
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Confirm changes instead of error when exiting modified buffer
vim.opt.confirm = true
-- Preview substitutions in a split window as you type
vim.opt.inccommand = "split"

--------------------------------------------------
-- Performance and History
--------------------------------------------------
-- Decrease update time for better user experience (ms)
vim.opt.updatetime = 250
-- Save undo history between sessions
vim.opt.undofile = true
