set fish_greeting ""
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "/home/linuxbrew/.linuxbrew/bin" $PATH
starship init fish | source
