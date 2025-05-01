function ApplyTheme(color)
    color = color or "boo"
    vim.cmd.colorscheme(color)

    if vim.fn.has("termguicolors") then
        vim.opt.termguicolors = true
    end

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


end

return {
    {
        'rockerBOO/boo-colorscheme-nvim',
        name = "boo",
        lazy = false,
        priority = 1000,

        config = function()
            require("boo-colorscheme").use({
                italic = false, -- toggle italics
                theme = "boo",
            })

            ApplyTheme("boo");
       end
    },
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
--        'catppuccin/nvim',
--        name = "catppuccin",
--        lazy = false,
--        priority = 1000,
--
--    },
--    {
--        'olivercederborg/poimandres.nvim',
--        name = "poimandres",
--        lazy = false,
--        priority = 1000,
--    },
--    {
--        "folke/tokyonight.nvim",
--        name = "tokyonight",
--        lazy = false,
--        priority = 1000,
--        opts = {},
--    },
}
