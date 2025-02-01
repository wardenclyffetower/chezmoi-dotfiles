return {

  { "nvim-telescope/telescope-file-browser.nvim", lazy = false },

  { "nvim-telescope/telescope-smart-history.nvim", lazy = false, dependencies = {
    "kkharji/sqlite.lua",
  } },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      local telescope_custom_actions = {}
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      --if not vim.api.nvim_eval("exists('g:neovide')") then
      function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
        local picker = action_state.get_current_picker(prompt_bufnr)
        local selected_entry = action_state.get_selected_entry()
        local num_selections = #picker:get_multi_selection()
        if not num_selections or num_selections <= 1 then
          actions.add_selection(prompt_bufnr)
        end
        actions.send_selected_to_qflist(prompt_bufnr)
        vim.cmd("silent cfdo " .. open_cmd)
      end

      function telescope_custom_actions.multi_selection_open_vsplit(prompt_bufnr)
        telescope_custom_actions._multiopen(prompt_bufnr, "vsplit")
      end
      function telescope_custom_actions.multi_selection_open_split(prompt_bufnr)
        telescope_custom_actions._multiopen(prompt_bufnr, "split")
      end
      function telescope_custom_actions.multi_selection_open_tab(prompt_bufnr)
        telescope_custom_actions._multiopen(prompt_bufnr, "tabe")
      end
      function telescope_custom_actions.multi_selection_open(prompt_bufnr)
        telescope_custom_actions._multiopen(prompt_bufnr, "edit")
      end

      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = { width = 0.75, height = 0.75, preview_cutoff = 1 },
          path_display = { shorten = { len = 4, exclude = { 1, -1 } } }, -- smart was too impactfull on performance
          history = {
            path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
            limit = 100,
          },
        },
        pickers = {
          current_buffer_fuzzy_find = {
            sorting_strategy = "ascending",
            default_text = vim.fn.expand("<cword>"),
          }, -- sorting by lines numbers & also getting by default the word under cursor
          find_files = {
            mappings = {
              i = {
                ["<CR>"] = telescope_custom_actions.multi_selection_open,
                ["<C-v>"] = telescope_custom_actions.multi_selection_open_vsplit,
                ["<C-s>"] = telescope_custom_actions.multi_selection_open_split,
                ["<C-t>"] = telescope_custom_actions.multi_selection_open_tab,
                ["<C-Down>"] = require("telescope.actions").cycle_history_next,
                ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
              },
            },
          },
        },
      })
    end,
  },
}
