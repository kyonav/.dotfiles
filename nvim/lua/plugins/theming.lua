    function ApplyTheme(color)
        color = color or "oxocarbon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "nyoom-engineering/oxocarbon.nvim",
        name = "oxocarbon",
        lazy = false,
        priority = 1000,

        config = function ()
            ApplyTheme("oxocarbon")

        end
    },
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
