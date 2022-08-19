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
            on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<leader>d", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            },
        },
    },
}})

rt.inlay_hints.disable()
