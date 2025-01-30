return {
  "saghen/blink.cmp",
  dependencies = {
    "moyiz/blink-emoji.nvim",
    "f3fora/cmp-spell",
    "andersevenrud/cmp-tmux",
  },
  opts = {
    -- appareance
    completion = {
      menu = { border = "single" },
      documentation = { window = { border = "single" } },
    },
    signature = { window = { border = "single" } },
    -- sources
    sources = {
      compat = { "tmux", "spell" },
      default = { "emoji" }, -- adding emoji to the default
      providers = {
        buffer = {
          score_offset = 50,
          opts = {
            -- (recommended) filter to only "normal" buffers but all the others
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ""
              end, vim.api.nvim_list_bufs())
            end,
          },
        },
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15, -- the higher the number, the higher the priority
          opts = { insert = true }, -- Insert emoji (default) or complete its name
        },
        tmux = {
          name = "tmux", -- IMPORTANT: use the same name as you would for nvim-cmp
          module = "blink.compat.source",
          -- all blink.cmp source config options work as normal:
          score_offset = 10,
          -- this table is passed directly to the proxied completion source
          -- as the `option` field in nvim-cmp's source config
          -- this is NOT the same as the opts in a plugin's lazy.nvim spec
          opts = {
            -- Source from all panes in session instead of adjacent panes
            all_panes = true,
            -- Completion popup label
            label = "[tmux]",
            -- Capture full pane history
            -- `false`: show completion suggestion from text in the visible pane (default)
            -- `true`: show completion suggestion from text starting from the beginning of the pane history.
            --         This works by passing `-S -` flag to `tmux capture-pane` command. See `man tmux` for details.
            capture_history = true,
          },
        },
        spell = {
          name = "spell", -- IMPORTANT: use the same name as you would for nvim-cmp
          module = "blink.compat.source",
          -- all blink.cmp source config options work as normal:
          score_offset = 14,
          -- this table is passed directly to the proxied completion source
          -- as the `option` field in nvim-cmp's source config
          -- this is NOT the same as the opts in a plugin's lazy.nvim spec
          opts = {
            label = "[spell]",
          },
        },
      }, -- fin providers
    }, -- fin sources
  }, -- fin opts
}
