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
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'rust_analyzer',
                'jsonls',
                'html',
                'lemminx',
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    local capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                    require('lspconfig')[server_name].setup { capabilities = capabilities }
                end,
            }
        })
    end
}
