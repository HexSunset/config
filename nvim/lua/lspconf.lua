local rt = require("rust-tools")

rt.setup({
    tools = {
        inlay_hints = {
            auto = false,
            show_parameter_hints = false,
        }
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    enable = false,
                },
            },
        },
    },
})

rt.inlay_hints.disable()
