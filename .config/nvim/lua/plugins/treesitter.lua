local add, now = MiniDeps.add, MiniDeps.now

now(function()
	add({
		source = "nvim-treesitter/nvim-treesitter",
		hooks = {
			post_checkout = function()
				vim.cmd("TSUpdate")
			end,
		},
	})
	add("nvim-treesitter/nvim-treesitter-textobjects")

	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"scala",
			"sql",
			"vim",
			"vimdoc",
		},
		highlight = { enable = true },
	})
end)
