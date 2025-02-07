return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<leader>tc"] = { "<cmd>Telescope colorscheme<CR>", desc = "Switch Colorscheme" },
        },
      },
    },
  },
}
