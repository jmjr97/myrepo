-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '<C-r>', api.tree.change_root_to_node,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        relativenumber = true,
        float = {quit_on_focus_loss = true},
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    actions = {open_file = {quit_on_open = true},},

  ---
  on_attach = my_on_attach,
  ---
}
