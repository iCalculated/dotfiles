set fish_greeting ""
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "/home/linuxbrew/.linuxbrew/bin" $PATH
set -gx PATH "/fufa/.local/bin" $PATH
set -gx PATH "home/fufa/.local/bin" $PATH
set -gx PLEASE "test"

set -gx DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0 

source /opt/ros/noetic/share/rosbash/rosfish

starship init fish | source

