return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'L3MON4D3/LuaSnip',
        'j-hui/fidget.nvim',
    },

    config = function()
        require('fidget').setup({})
        require('mason').setup({
            ensure_installed = {
                'roslyn'
            }
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'rust_analyzer',
                'htmx',
                'jsonls',
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    local capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                    require('lspconfig')[server_name].setup { capabilities = capabilities }
                end,

                zls = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.zls.setup({
                        root_dir = lspconfig.util.root_pattern('.git', 'build.zig', 'zls.json'),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,

                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,
            }
        })
    end
}
