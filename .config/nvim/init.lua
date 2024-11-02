-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.lazy")

-- vim: ts=2 sts=2 sw=2 et
