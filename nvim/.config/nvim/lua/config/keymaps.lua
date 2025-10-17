-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("oil").setup({
  keymaps = {
    ["h"] = "actions.parent",
    ["l"] = "actions.select",
    ["q"] = "actions.close",
    ["t"] = "actions.toggle_hidden",
  },
  use_default_keymaps = false,
  show_hidden = true,
})

vim.keymap.set("n", "<leader>m", ":Oil<CR>", { noremap = true, silent = true, desc = "Open Oil.nvim" })
