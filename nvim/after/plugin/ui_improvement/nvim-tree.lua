vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
  disable_netrw = true,
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    group_empty = true,
  },
})

vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>tr", vim.cmd.NvimTreeRefresh)
