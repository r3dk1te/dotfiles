# ~/.zshrc  (oh-my-zsh + powerlevel10k, Gruvbox rice)

# Make sure user-installed tools (eza, lazygit, ...) are found
export PATH="$HOME/.local/bin:$PATH"

# Run fastfetch in every new interactive terminal (not inside tmux).
# Kept above the p10k instant prompt on purpose.
[[ -o interactive && -t 1 && -z $TMUX ]] && command -v fastfetch >/dev/null && fastfetch

# Powerlevel10k instant prompt. Keep this near the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Autosuggestion colour (light grey, readable on the dark Gruvbox background)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=250'

# Custom plugins (clone into $ZSH/custom/plugins): zsh-autosuggestions, zsh-syntax-highlighting (github.com/zsh-users)
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Powerlevel10k prompt config (run `p10k configure` to change it)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- aliases -----------------------------------------------------------------
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'

# eza (icons, git status, tree). Falls back to plain ls if eza isn't installed.
unalias l ll 2>/dev/null
if command -v eza >/dev/null 2>&1; then
  l()   { eza --icons=always --group-directories-first --color=always "${@:-.}"; }
  ll()  { eza --icons=always --long --all --group-directories-first --git --color=always "${@:-.}"; }
  lls() { eza --icons=always --long --all --total-size --group-directories-first --git --color=always "${@:-.}"; }
  lt()  { eza --tree --icons=always --git --color=always "${@:-.}"; }
else
  alias l='ls -CF'
  alias ll='ls -alF'
fi

alias gst='git status -sb'
alias gl='git log --oneline --graph --decorate --all'
alias gp='git push'
alias gpl='git pull'
alias conf='cd ~/.config'
alias cleanup='sudo apt clean && sudo apt autoclean && sudo apt autoremove --purge -y && sudo journalctl --vacuum-time=7d'
alias batt="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'state|percentage|time to empty|time to full'"

# zoxide: smarter cd (use `z <dir>`)
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
