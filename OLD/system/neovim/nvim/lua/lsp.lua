local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { buffer = 0 })
    -- get all references
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = 0 })
    -- get all implementations
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.implementation, { buffer = 0 })
end

-- Python
require("lspconfig").pyright.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- C/C++
require("lspconfig").clangd.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Rust
require("lspconfig").rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- GoLang
require("lspconfig").gopls.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Bash/ZSH
require("lspconfig").bashls.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Javascript/Typescript
require("lspconfig").denols.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Javascript/Typescript
require("lspconfig").eslint.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- HTML/CSS
require("lspconfig").tailwindcss.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Lua
require("lspconfig").lua_ls.setup {
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
