-- Cool App Idea:
----Boilerplate command for languages
-- TODO:
----cheatsheet nvim
----DAP
----make a plugin for git smashing?? Or git fugitive?
----make a plugin for running files
----make a plugin for TODO (Like a popup window with a todo list)
----figure out luasnips
----refactor so that the code doesn't look like crap
----better bracket matching (for things like html tags too)
----break monolithic file into smaller files to fix shit
----checkout comment.nvim
----code runner
----checkout scrolling section
----testing plugins?
----spellsitter
----template c++ code setup
----harpoon?
----figure out how to jump back to previous spot
----test autosaving features
----refactor and break up monolithic config
----figure out what the heck winbar is
----add the ability to hide and fold functions
----fix the replace function
----replace lsp installer with mason
----auto pairs
----dashboard-nvim
----nvim tree?
----pop up in the corner that tells you how many consecutive keys you have pressed

require("plugins")
require("treesitter")
require("options")
require("cosmetics")
require("keymaps")
require("navigation")
require("misc")
require("autocomplete")

require("debugging")
