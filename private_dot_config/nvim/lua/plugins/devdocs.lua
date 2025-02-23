return {
  "maskudo/devdocs.nvim",
  lazy = false,
  dependencies = {
    "folke/snacks.nvim",
  },
  keys = {
    {
      "<leader>ho",
      mode = "n",
      "<cmd>DevDocs get<cr>",
      desc = "Get Devdocs",
    },
    {
      "<leader>hi",
      mode = "n",
      "<cmd>DevDocs install<cr>",
      desc = "Install Devdocs",
    },
    {
      "<leader>hv",
      mode = "n",
      function()
        local devdocs = require("devdocs")
        local installedDocs = devdocs.GetInstalledDocs()
        vim.ui.select(installedDocs, {}, function(selected)
          if not selected then
            return
          end
          local docDir = devdocs.GetDocDir(selected)
          -- prettify the filename as you wish
          Snacks.picker.files({ cwd = docDir })
        end)
      end,
      desc = "View Devdocs",
    },
  },
  opts = {
    ensure_installed = {
      "bash",
      "css",
      "dom",
      "go",
      "html",
      "htmx",
      "http",
      "javascript",
      "lua~5.1",
      "markdown",
      -- "openjdk~21",
      "php",
      "playwright",
      "python",
      "rust",
      -- check `DevDocs install` to view the actual names of the docs
      -- some docs such as lua require version number along with the language name
    },
  },
}
