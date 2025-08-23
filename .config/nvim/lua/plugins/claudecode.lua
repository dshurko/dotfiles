local add, later = MiniDeps.add, MiniDeps.later
local map_leader = require("utils").map_leader

later(function()
  add({
    source = "coder/claudecode.nvim",
    depends = { "folke/snacks.nvim" },
  })

  require("claudecode").setup()

  map_leader("n", "ac", "<cmd>ClaudeCode<cr>", "Toggle Claude")
  map_leader("n", "af", "<cmd>ClaudeCodeFocus<cr>", "Focus Claude")
  map_leader("n", "ar", "<cmd>ClaudeCode --resume<cr>", "Resume Claude")
  map_leader("n", "aC", "<cmd>ClaudeCode --continue<cr>", "Continue Claude")
  map_leader("n", "am", "<cmd>ClaudeCodeSelectModel<cr>", "Select Claude model")
  map_leader("n", "ab", "<cmd>ClaudeCodeAdd %<cr>", "Add current buffer")
  map_leader("v", "as", "<cmd>ClaudeCodeSend<cr>", "Send to Claude")

  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "NvimTree", "neo-tree", "oil", "minifiles" },
    callback = function(args)
      map_leader("n", "as", "<cmd>ClaudeCodeTreeAdd<cr>", "Add file", { buffer = args.buf })
    end,
  })

  map_leader("n", "aa", "<cmd>ClaudeCodeDiffAccept<cr>", "Accept diff")
  map_leader("n", "ad", "<cmd>ClaudeCodeDiffDeny<cr>", "Deny diff")
end)
