if status is-interactive
    set fish_greeting "Ahoy, captain!"
    fish_config prompt choose informative_vcs
    fish_config theme choose Base16\ Default\ Dark

    set -gx EDITOR nvim

    set -gx GTK_IM_MODULE fcitx
    set -gx QT_IM_MODULE fcitx
    set -gx XMODIFIERS fcitx
    set -gx GLFW_IM_MODULE ibus

    alias r "rm -f"
    alias rr "rm -rf"

    alias l  "exa"
    alias ls "exa"
    alias ll "exa -l"
    alias la "exa -la"
    
    alias hx "helix"

    alias nv "nvim"
    alias lg "lazygit"
end
