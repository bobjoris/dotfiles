return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		mappings = {
			n = {
				["f"] = false,
				["F"] = false,
				["t"] = false,
				["T"] = false,
				["<C-d>"] = { "<C-d>zz" },
				["<C-f>"] = { "<C-f>zz" },
				["<C-u>"] = { "<C-u>zz" },
				["<C-b>"] = { "<C-b>zz" },
			},
		},
		features = {
			diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
		},
	},
}
