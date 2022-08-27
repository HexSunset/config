if status is-interactive
    set fish_greeting
    set -gx EDITOR nvim
    set -gx PAGER bat

    alias r "rm -f"
    alias rr "rm -rf"

    alias l  "exa"
    alias ls "exa"
    alias ll "exa -l"
    alias la "exa -la"
end
