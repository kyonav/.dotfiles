function ApplyTheme(color)
    color = color or "eva01"
    vim.cmd.colorscheme(color)

    if vim.fn.has("termguicolors") then
        vim.opt.termguicolors = true
    end

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "hachy/eva01.vim",
        name = eva01,
        lazy = false,
        priority = 1000,
        config = function()
            ApplyTheme("eva01");
            -- or
            -- vim.cmd.colorscheme "eva01-LCL"
        end,
    },
--    {
--        'rockerBOO/boo-colorscheme-nvim',
--        name = "boo",
--        lazy = false,
--        priority = 1000,
--
--        config = function()
--            require("boo-colorscheme").use({
--                italic = false, -- toggle italics
--                theme = "boo",
--            })
--
--            ApplyTheme("boo");
--       end
--    },
--    {
--        'nyoom-engineering/oxocarbon.nvim',
--        name = "oxocarbon",
--        lazy = false,
--        priority = 1000,
--
--        config = function ()
--            ApplyTheme("oxocarbon")
--
--        end
--    },
--    {
--        'olivercederborg/poimandres.nvim',
--        name = "poimandres",
--        lazy = false,
--        priority = 1000,
--
--        config = function ()
--            ApplyTheme("poimandres")
--
--        end
--    },
--    {
--        "folke/tokyonight.nvim",
--        name = "tokyonight",
--        lazy = false,
--        priority = 1000,
--        opts = {},
--    },
}
