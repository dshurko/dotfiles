local now, later = MiniDeps.now, MiniDeps.later
local utils = require("utils")
local map, map_leader = utils.map, utils.map_leader

--------------------------------------------------
-- Text editing
--------------------------------------------------
later(function()
  local spec_treesitter = require("mini.ai").gen_spec.treesitter
  require("mini.ai").setup({
    custom_textobjects = {
      c = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
      F = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
      o = spec_treesitter({
        a = { "@conditional.outer", "@loop.outer" },
        i = { "@conditional.inner", "@loop.inner" },
      }),
    },
    n_lines = 500,
  })
end)

later(function()
  require("mini.pairs").setup()
end)

later(function()
  require("mini.surround").setup()
end)

--------------------------------------------------
-- General workflow
--------------------------------------------------
later(function()
  require("mini.diff").setup({
    view = {
      style = "sign",
      signs = { add = "+", change = "~", delete = "-" },
    },
  })
end)

later(function()
  require("mini.extra").setup()
end)

later(function()
  require("mini.files").setup({
    mappings = { close = "<Esc>" },
  })

  -- Toggle explorer
  local minifiles_toggle = function(...)
    if not MiniFiles.close() then
      MiniFiles.open(...)
    end
  end

  map("n", "-", function()
    minifiles_toggle(vim.api.nvim_buf_get_name(0))
  end, "Toggle file explorer [-]")

  -- Show/hide dot-files
  local show_dotfiles = true

  local filter_show = function(fs_entry)
    return true
  end

  local filter_hide = function(fs_entry)
    return not vim.startswith(fs_entry.name, ".")
  end

  local toggle_dotfiles = function()
    show_dotfiles = not show_dotfiles
    local new_filter = show_dotfiles and filter_show or filter_hide
    MiniFiles.refresh({ content = { filter = new_filter } })
  end

  -- Yank in register full path of entry under cursor
  local yank_path = function()
    local path = (MiniFiles.get_fs_entry() or {}).path
    if path == nil then
      return vim.notify("Cursor is not on valid entry")
    end
    vim.fn.setreg(vim.v.register, path)
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args)
      local buf_id = args.data.buf_id
      map("n", ".", toggle_dotfiles, "Toggle [.]dotfiles", { buffer = buf_id })
      map("n", "Y", yank_path, "[Y]ank path", { buffer = buf_id })
    end,
  })
end)

later(function()
  require("mini.git").setup()
end)

later(function()
  require("mini.pick").setup()

  vim.ui.select = MiniPick.ui_select

  map_leader("n", "f/", '<Cmd>Pick buf_lines scope="current"<CR>', "[F]ind in current buffer (enhanced [/])")
  map_leader("n", "f:", '<Cmd>Pick history scope=":"<CR>', "[F]ind command history (enhanced [:])")
  map_leader("n", "fa", function()
    MiniPick.builtin.cli({ command = { "fd", "--hidden", "--no-ignore", "--exclude", ".git", "--type", "file" } })
  end, "[F]ind [A]ll files (including hidden)")
  map_leader("n", "fb", "<Cmd>Pick buffers<CR>", "[F]ind [B]uffers")
  map_leader("n", "ff", "<Cmd>Pick files<CR>", "[F]ind [F]iles")
  map_leader("n", "fg", "<Cmd>Pick grep_live<CR>", "[F]ind by [G]rep")
  map_leader("n", "fh", "<Cmd>Pick help<CR>", "[F]ind [H]elp")
  map_leader("n", "fk", "<Cmd>Pick keymaps<CR>", "[F]ind [K]eymaps")
  map_leader("n", "fn", function()
    MiniPick.builtin.files({}, { source = { cwd = vim.fn.stdpath("config") } })
  end, "[F]ind [N]eovim config files")
  map_leader("n", "fo", "<Cmd>Pick oldfiles<CR>", "[F]ind [O]ld files")
  map_leader("n", "fr", "<Cmd>Pick resume<CR>", "[F]ind [R]esume last picker")
  map_leader("n", "fw", '<Cmd>Pick grep pattern="<cword>"<CR>', "[F]ind [W]ord under cursor")
end)

--------------------------------------------------
-- Appearance
--------------------------------------------------
later(function()
  require("mini.cursorword").setup()
end)

now(function()
  require("mini.icons").setup()
end)

later(function()
  require("mini.indentscope").setup()
end)

now(function()
  require("mini.notify").setup()

  vim.notify = MiniNotify.make_notify()
end)

now(function()
  require("mini.statusline").setup()
end)
