return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ["h"] = "actions.parent",
      ["l"] = "actions.select",
      ["q"] = "actions.close",
      ["t"] = "actions.toggle_hidden",
    },
    use_default_keymaps = false,
    view_options = {
      show_hidden = true,
    },
    skip_confirm_for_simple_edits = true,
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}