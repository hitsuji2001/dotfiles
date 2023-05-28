vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
  vim.cmd({ cmd = "wincmd", args = { "l" }})
end

require("nvim-tree").setup()
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFocus)
