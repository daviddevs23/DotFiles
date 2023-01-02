-- CMP Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup nvim-cmp.
local cmp = require("cmp")

if cmp ~= nil then
    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            -- TODO: Change the autocomplete confirm key to something that isn"t the freaking new line key
            ["<S-CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "nvim_lua" },
        }, {
            { name = "buffer" },
            { name = "path" },
            { name = "luasnip" },
            { name = "spell" },
        })
    })
end

-- LSP
local custom_attach = function()
    -- shows information window about what you are hovering over
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    -- goes to definition
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    -- gives you the type definition
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    -- rename variables, might have to hit :wa after you run this
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
    -- got to next issue in buffer
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
    -- got to next issue in buffer
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
    -- code actions
    vim.keymap.set("n", "cd", vim.lsp.buf.code_action, { buffer = 0 })
    -- code formatting
    vim.keymap.set("n", "<space>f", vim.lsp.buf.format, { buffer = 0 })
end

-- Python
require("lspconfig").pyright.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Python
require("lspconfig").jedi_language_server.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- C++/C
require("lspconfig").clangd.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Rust
require("lspconfig").rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Golang
require("lspconfig").gopls.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Bash
require("lspconfig").bashls.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Javascript/Typescript
require("lspconfig").tsserver.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Ansible
require("lspconfig").ansiblels.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- HTML and CSS
require("lspconfig").emmet_ls.setup{
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- svelte
require("lspconfig").svelte.setup{
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Lua
require("lspconfig").sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
