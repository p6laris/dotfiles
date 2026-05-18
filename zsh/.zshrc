# ---------------------
# 🛠 Locale & Editor
# ---------------------
export LANG="en_US.UTF-8"
export EDITOR="code -w"

# ---------------------
# 🛤 PATH
# ---------------------
export PATH="$PATH:$HOME/.config/flutter"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH

# ---------------------
# 🔑 Secrets (Local Only)
# ---------------------
[ -f "$HOME/.zsh_local" ] && source "$HOME/.zsh_local"
export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
export ANTHROPIC_API_KEY="" # Important: Must be explicitly empty


export CXX=/usr/bin/clang++
export CC=/usr/bin/clang
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

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH=/home/p0laris/.opencode/bin:$PATH
