-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
	"AstroNvim/astrolsp",
	---@type AstroLSPOpts
	opts = {
		formatting = {
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
			},
			timeout_ms = 2000, -- default format timeout
		},
		-- config = {
		-- 	ts_ls = {
		-- 		init_options = {
		-- 			plugins = {
		-- 				{
		-- 					name = "@vue/typescript-plugin",
		-- 					location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
		-- 					languages = { "javascript", "typescript", "vue" },
		-- 				},
		-- 			},
		-- 		},
		-- 		filetypes = { "typescript", "typescriptreact", "typescript.tsx", "vue" },
		-- 	},
		-- 	volar = {
		-- 		filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		-- 		init_options = {
		-- 			typescript = {
		-- 				tsdk = vim.fn.stdpath("data")
		-- 						.. "/mason/packages/typescript-language-server/node_modules/typescript/lib",
		-- 			},
		-- 		},
		-- 	},
		-- 	treesitter = {
		-- 		ensure_installed = { "typescript", "tsx", "vue" },
		-- 	},
		-- },
	},
}
