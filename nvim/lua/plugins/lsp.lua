return {
	{
		"neovim/nvim-lspconfig",
		config = function()
            vim.lsp.enable('pyright')
            vim.lsp.enable("ruff")
            
            vim.keymap.set(
                "n", "E", vim.diagnostic.open_float,
                { desc = "Show diagnostic" }
            )
            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		end,
	},
}

