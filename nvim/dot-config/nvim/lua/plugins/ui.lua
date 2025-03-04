if true then
	return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
	"AstroNvim/astroui",
	---@type AstroUIOpts
	opts = {
		highlights = {
			init = {
				Normal = { bg = "NONE", ctermbg = "NONE" },
				NormalNC = { bg = "NONE", ctermbg = "NONE" },
				CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
				CursorLine = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
				CursorLineNr = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
				LineNr = {},
				SignColumn = {},
				StatusLine = {},
				NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
				NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
			},
		},
	},
}
