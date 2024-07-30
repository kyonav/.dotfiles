function applyTheme(color)
    color = color or "aura-dark"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    { 
        "baliestri/aura-theme",
        name = "aura-theme",
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
            applyTheme()
        end
    },
--    {
--        "nyoom-engineering/oxocarbon.nvim",
--        name = "oxocarbon",
--    },
--    {
--        "folke/tokyonight.nvim",
--        name = "tokyonight",
--        lazy = false,
--        priority = 1000,
--        opts = {},
--    }
}
