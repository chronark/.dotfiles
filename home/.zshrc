# Add site-functions to fpath (required for Homebrew installations)
fpath+=("/opt/homebrew/share/zsh/site-functions")

# Initialize starship prompt
eval "$(starship init zsh)"

# fzf integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Syntax highlighting (must be near the end)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions (must be at the end)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# Initialize zoxide
eval "$(zoxide init zsh)"


alias ll="eza -1 -l --group-directories-first -h --no-user --git  --time-style=relative --icons=always"

alias lg='lazygit'


export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"




setopt share_history
setopt append_history
setopt inc_append_history
source <(fzf --zsh)
eval "$(atuin init zsh)"


alias oc='opencode'

# Amp CLI
export PATH="/Users/chronark/.amp/bin:$PATH"
