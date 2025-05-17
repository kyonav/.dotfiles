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
                roslyn = function()
                    local lspconfig = require("lspconfig")
                    local mason_registry = require("mason-registry")

                    ---@type string[]
                    local cmd = {}

                    local roslyn_package = mason_registry.get_package("roslyn")
                    if roslyn_package:is_installed() then
                        vim.list_extend(cmd, {
                            "roslyn",
                            "--stdio",
                            "--logLevel=Error",
                            "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
                        })

                        local rzls_package = mason_registry.get_package("rzls")
                        if rzls_package:is_installed() then
                            local rzls_path = vim.fn.expand("$MASON/packages/rzls/libexec")
                            table.insert(
                                cmd,
                                "--razorSourceGenerator=" .. vim.fs.joinpath(rzls_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll")
                            )
                            table.insert(
                                cmd,
                                "--razorDesignTimePath=" ..
                                vim.fs.joinpath(rzls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets")
                            )
                            vim.list_extend(cmd, {
                                "--extension",
                                vim.fs.joinpath(rzls_path, "RazorExtension", "Microsoft.VisualStudioCode.RazorExtension.dll"),
                            })
                        end
                    end

                    lspconfig.roslyn.setup({
                        cmd = cmd,
                        filetypes = { "cs", "vb", "razor" },
                        root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
                    })
                end,

                --function(server_name) -- default handler (optional)
                --    local capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                --    require('lspconfig')[server_name].setup { capabilities = capabilities }
                --end,
            }
        })
    end
}
