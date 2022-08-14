if status is-interactive
    set fish_greeting
    set -gx EDITOR nvim
    alias r "rm -f"
    alias rr "rm -rf"

    alias ls "exa"
    alias ll "exa -l"
    alias la "exa -la"
end
