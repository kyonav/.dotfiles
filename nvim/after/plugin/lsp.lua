local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)

---require('mason').setup({})
---require('mason-lspconfig').setup({
---	-- Replace the language servers listed here 
---	-- with the ones you want to install
---	ensure_installed = {'biome', 'cssls'},
---	handlers = {
---		function(server_name)
---			require('lspconfig')[server_name].setup({})
---		end,
---	},
---})

local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip.loaders.from_vscode').lazyload() -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer' },
	})
})

require("luasnip.loaders.from_vscode").lazy_load()

--- setting up null_ls to use prettier
local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})

---setting up prettier itself
local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd',
  -- or 'prettier'
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },

   cli_options = {
     arrow_parens = "always",
     bracket_spacing = true,
     bracket_same_line = false,
     embedded_language_formatting = "auto",
     end_of_line = "lf",
     html_whitespace_sensitivity = "css",
     -- jsx_bracket_same_line = false,
     jsx_single_quote = false,
     print_width = 80,
     prose_wrap = "preserve",
     quote_props = "as-needed",
     semi = true,
     single_attribute_per_line = false,
     single_quote = false,
     tab_width = 4,
     trailing_comma = "es5",
     use_tabs = false,
     vue_indent_script_and_style = false,
  },

})
