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
  config = function(_, opts)
    require("oil").setup(opts)
    -- Sync CWD with oil directory
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "oil://*",
      callback = function()
        local dir = require("oil").get_current_dir()
        if dir then
          vim.fn.chdir(dir)
        end
      end,
    })
  end,
}
