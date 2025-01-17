return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        -- Set `fg` to the color you want your window separators to have
        hl.WinSeparator = { fg = "white", bold = false }
      end,
    })
  end,
}
