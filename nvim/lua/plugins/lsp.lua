return {
	{
		"neovim/nvim-lspconfig",
		config = function()
            vim.lsp.enable('pyright')
            
            vim.keymap.set(
                "n",
                "E",
                vim.diagnostic.open_float,
                { desc = "Show diagnostic" }
            )
		end,
	},
}

