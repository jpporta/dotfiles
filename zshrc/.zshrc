plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_TITLE="true"

eval "$(starship init zsh)" 
alias tx="tmuxinator"
alias gup="git add --all && git commmit -m \"$(date)\" && git push"
alias n="nvim --listen /tmp/nvim$(echo $RANDOM | md5sum | cut -c1-8).sock"
alias asr="atuin scripts run"
alias man="batman"
alias :q="exit"
alias process-notes="mv ~/Documents/Recordings/unprocessed/* ~/Documents/Recordings/processed"

source <(fzf --zsh)

alias enc="openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 1000000 -salt"

alias ct="create-task"
alias dt="done-task"
alias cl="create-list"
alias clt="create-linear-ticket"
alias m_vps="sshfs -o reconnect,ServerAliveInterval=1 jpporta@192.168.3.200:/media/drive /home/VPS"

export LANG=en_US.utf8
export LC_COLLATE=$LANG
export LC_CTYPE=$LANG
export LC_MESSAGES=$LANG
export LC_MONETARY=$LANG
export LC_NUMERIC=$LANG
export LC_TIME=$LANG
export LC_ALL=$LANG
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export GPG_TTY=$(tty)

alias ls="eza --icons=always"
eval "$(zoxide init zsh --cmd cd)"

alias bat="bat --theme ~/.config/bat/themes/Catppuccin\ Mocha.tmTheme"

export EDITOR=nvim

alias backup="packup && rm ~/Documents/packup* && mv ~/packup* ~/Documents/ && rsync --archive --update --copy-links ~/Documents 192.168.0.200:/home/jpporta/ --info=progress2"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/jpporta/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
fastfetch
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(mise activate zsh)"
