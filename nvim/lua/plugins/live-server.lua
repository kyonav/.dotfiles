return { "barrett-ruth/live-server.nvim", opts = {
    build = "pnpm add -g live-server", 
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,

    } 
}
