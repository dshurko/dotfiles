local add, later = MiniDeps.add, MiniDeps.later

later(function()
	add("stevearc/conform.nvim")

	require("conform").setup({
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			python = { "ruff_organize_imports", "ruff_format" },
			sh = { "shfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})
end)
