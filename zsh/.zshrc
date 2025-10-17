# ---------------------
# 🛠 Locale & Editor
# ---------------------
export LANG="en_US.UTF-8"
export EDITOR="code -w"

# ---------------------
# 🛤 PATH
# ---------------------

# ---------------------
# 🕘 History Settings
# ---------------------
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000

setopt INTERACTIVE_COMMENTS
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ---------------------
# 🧼 Terminal Behavior
# ---------------------
stty -ixon  # Disable Ctrl+S / Ctrl+Q flow control

# ---------------------
# 🔁 Completion System
# ---------------------
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete  # Shift+Tab to go backwards in completion menu

# ---------------------
# ⌨️ Keybindings (Optional Enhancements)
# ---------------------

# History search with arrow keys
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Word navigation with Ctrl + Arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# ---------------------
# 🔌 Plugins
# ---------------------

# Autosuggestions
source "$HOME/.my-custom-zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Syntax highlighting
source "$HOME/.my-custom-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

source "$HOME/.my-custom-zsh/zsh-vi-mode/zsh-vi-mode.zsh"

# ---------------------
# 🧭 Optional Tools
# ---------------------

# fzf (only if installed)
command -v fzf >/dev/null && eval "$(fzf --zsh)"

# Starship prompt
eval "$(starship init zsh)"
