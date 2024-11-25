set fish_greeting ""

fish_vi_key_bindings

set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "/opt/homebrew/bin" $PATH
set -gx PATH "$ANDROID_HOME/cmdline-tools/latest/bin" $PATH
set -gx PATH "/Users/shy/.nvm/versions/node/v20.11.1/bin" $PATH
set -x GOPATH "$HOME/go"
set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/temurin-18.jdk/Contents/Home"

status is-interactive; and pyenv init --path | source
pyenv init - | source

starship init fish | source

# opam configuration
source /Users/shy/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

source /opt/homebrew/opt/asdf/libexec/asdf.fish

fish_ssh_agent

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shy/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/shy/Downloads/google-cloud-sdk/path.fish.inc'; end
