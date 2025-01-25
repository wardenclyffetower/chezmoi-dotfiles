return {
  "saghen/blink.cmp",
  dependencies = {
    "moyiz/blink-emoji.nvim",
    "Kaiser-Yang/blink-cmp-dictionary",
    "f3fora/cmp-spell",
  },
  opts = {
    sources = {
      compat = { "spell" },
      default = { "emoji" }, -- adding emoji to the default
      providers = {
        -- create provider
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15, -- the higher the number, the higher the priority
          opts = { insert = true }, -- Insert emoji (default) or complete its name
        },
        spell = {
          name = "spell", -- IMPORTANT: use the same name as you would for nvim-cmp
          module = "blink.compat.source",
          -- all blink.cmp source config options work as normal:
          score_offset = -3,
          -- this table is passed directly to the proxied completion source
          -- as the `option` field in nvim-cmp's source config
          -- this is NOT the same as the opts in a plugin's lazy.nvim spec
          opts = {},
        },
      }, -- fin providers
    }, -- fin sources
  }, -- fin opts
}
