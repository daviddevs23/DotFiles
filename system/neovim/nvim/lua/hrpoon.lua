-- Key remaps
local menu = require("harpoon.ui")
local marks = require("harpoon.mark")

vim.keymap.set("n", "<leader>tt", menu.toggle_quick_menu)
vim.keymap.set("n", "<leader>t", marks.add_file)
