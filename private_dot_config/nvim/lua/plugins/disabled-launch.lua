local cfg = {
  debug = {
    disable = true,
  },
}
return {
  "dasupradyumna/launch.nvim",
  enabled = false,
  lazy = false,
  -- -- add below plugins as per user requirement
  -- dependencies = {
  --   "mfussenegger/nvim-dap",
  --   "rcarriga/nvim-notify",
  -- },
  opts = cfg,
}
