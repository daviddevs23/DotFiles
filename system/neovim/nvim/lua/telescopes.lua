local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Open telescope fuzzy finder
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

require("telescope").setup {
    defaults = {
        prompt_prefix = ">> "
    },
}
