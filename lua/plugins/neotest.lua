return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"haydenmeade/neotest-jest",
			"marilari88/neotest-vitest",
		},
		config = function()
			require('neotest').setup({
				adapters = {
					require('neotest-vitest'),
					require('neotest-jest')({
						jestCommand = function(path)
							return "npx jest --  --json --forceExit --detectOpenHandles " .. path:gsub("\\", "/")
						end,
						discovery = {
							enabled = false,
						},
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd():gsub("\\", "/")
						end,
					})
					,
				}
			})
		end

	}

}
