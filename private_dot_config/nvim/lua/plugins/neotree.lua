return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["L"] = "open_nofocus",
        },
      },
      commands = {
        open_nofocus = function(state)
          require("neo-tree.sources.filesystem.commands").open(state)
          vim.schedule(function()
            vim.cmd([[Neotree focus]])
          end)
        end,
      },
    },
    sources = { "filesystem", "buffers", "git_status", "netman.ui.neo-tree" },
  },
}
