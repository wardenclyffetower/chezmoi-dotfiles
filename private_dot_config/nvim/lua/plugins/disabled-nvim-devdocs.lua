return {
  "luckasRanarison/nvim-devdocs",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    dir = vim.fn.stdpath("data") .. "/devdocs", -- ~/.local/share/nvim/devdocs
  },
}
