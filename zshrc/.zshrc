plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export TERM=tmux-256color

eval "$(starship init zsh)" 
alias tx="tmuxinator"
alias gup="git add --all && git commmit -m \"$(date)\" && git push"
alias n="nvim"

source <(fzf --zsh)


export LANG=en_US.utf8
export LC_COLLATE=$LANG
export LC_CTYPE=$LANG
export LC_MESSAGES=$LANG
export LC_MONETARY=$LANG
export LC_NUMERIC=$LANG
export LC_TIME=$LANG
export LC_ALL=$LANG

export GPG_TTY=$(tty)

alias ls="eza --icons=always"
eval "$(zoxide init zsh --cmd cd)"

alias bat="bat --theme ~/.config/bat/themes/Catppuccin\ Mocha.tmTheme"
export HOMEBREW_NO_ENV_HINTS=1

export PATH=$PATH:/Users/jpporta/.local/share/nvim/mason/bin

# pnpm
export PNPM_HOME="/Users/jpporta/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export EDITOR=nvim
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# bun completions
[ -s "/Users/jpporta/.bun/_bun" ] && source "/Users/jpporta/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:/home/jpporta/go/bin/"
export PATH="$PATH:/home/jpporta/.local/bin"
export PATH="$PATH:/home/jpporta/.local/python3.13/site-packages"

alias pc="ssh jpporta@192.168.3.150"

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias gnow="git commit --amend --date=\"$(date -R)\""
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
export PATH="$PATH:/Users/jpporta/.dotnet/tools"

macchina
