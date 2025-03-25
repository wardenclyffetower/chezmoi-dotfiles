return {
  "salkin-mada/openscad.nvim",
  config = function()
    vim.g.openscad_load_snippets = true
    vim.g.openscad_fuzzy_finder = "skim"
    vim.g.openscad_cheatsheet_window_blend = 15 --%
    vim.g.openscad_load_snippets = false
    -- should the openscad project automatically be opened on startup
    vim.g.openscad_auto_open = false
    require("openscad")
  end,
  dependencies = { "L3MON4D3/LuaSnip", "junegunn/fzf.vim" },
}
