-- Highlight yanked text to provide visual feedback when copying
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text on yank",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Automatically close lazygit terminal buffers when the process exits
vim.api.nvim_create_autocmd("TermClose", {
  desc = "Auto-close lazygit terminal buffers",
  group = vim.api.nvim_create_augroup("lazygit-autoclose", { clear = true }),
  pattern = "*lazygit*",
  callback = function(event)
    vim.cmd("bdelete! " .. event.buf)
  end,
})
