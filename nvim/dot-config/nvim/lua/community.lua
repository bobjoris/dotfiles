-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.git.git-blame-nvim" },
	{ import = "astrocommunity.completion.copilot-cmp" },
	{ import = "astrocommunity.utility.noice-nvim" },
	{ import = "astrocommunity.recipes.cache-colorscheme" },
	{ import = "astrocommunity.recipes.heirline-mode-text-statusline" },
	{ import = "astrocommunity.colorscheme.bamboo-nvim" },
	{ import = "astrocommunity.colorscheme.catppuccin" },
	{ import = "astrocommunity.colorscheme.nightfox-nvim" },
	{ import = "astrocommunity.colorscheme.vscode-nvim" },
	-- import/override with your plugins folder
}
