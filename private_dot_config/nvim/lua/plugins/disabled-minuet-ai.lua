return {
  "milanglacier/minuet-ai.nvim",
  enabled = false,
  lazy = false,

  config = function()
    require("minuet").setup({
      cmp = {
        enable_auto_complete = false,
      },
      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          -- accept whole completion
          accept = "<A-A>",
          -- accept one line
          accept_line = "<A-a>",
          -- accept n lines (prompts for number)
          -- e.g. "A-z 2 CR" will accept 2 lines
          accept_n_lines = "<A-z>",
          -- Cycle to prev completion item, or manually invoke completion
          prev = "<A-[>",
          -- Cycle to next completion item, or manually invoke completion
          next = "<A-]>",
          dismiss = "<A-e>",
        },
      },
      provider_options = {
        codestral = {
          model = "codestral-latest",
          -- end_point = "https://codestral.mistral.ai/v1/fim/completions",
          end_point = "https://codestral.mistral.ai/v1/fim/completions",
          api_key = "CODESTRAL_API_KEY",
          stream = true,
          -- template = {
          --   prompt = "See [Prompt Section for default value]",
          --   suffix = "See [Prompt Section for default value]",
          -- },
          -- optional = {
          --   stop = nil, -- the identifier to stop the completion generation
          --   max_tokens = nil,
          -- },
        },
      },
    })
  end,
}
