-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	-- { import = "astrocommunity.completion.copilot-lua-cmp" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.git.git-blame-nvim" },
	{ import = "astrocommunity.recipes.ai" },
	{ import = "astrocommunity.recipes.cache-colorscheme" },
	{ import = "astrocommunity.recipes.heirline-mode-text-statusline" },
	-- { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
	{ import = "astrocommunity.colorscheme.catppuccin" },
	{ import = "astrocommunity.colorscheme.dracula-nvim" },
	{ import = "astrocommunity.colorscheme.eldritch-nvim" },
	{ import = "astrocommunity.colorscheme.everforest" },
	{ import = "astrocommunity.colorscheme.kanagawa-nvim" },
	{ import = "astrocommunity.colorscheme.kanagawa-paper-nvim" },
	{ import = "astrocommunity.colorscheme.nightfox-nvim" },
	{ import = "astrocommunity.colorscheme.oldworld-nvim" },
	{ import = "astrocommunity.colorscheme.vscode-nvim" },
}
