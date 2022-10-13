-- Telescope
require("telescope").setup {
    -- ctrl v will vertical split the current prompted file
    -- ctrl x will horizontal split the current prompted file
    -- ctrl t will open in a new tab the current prompted file
    defaults = {
        prompt_prefix = ">> "
    },
}

-- Barbar
-- Keymaps are in keymap.lua
