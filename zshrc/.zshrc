export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias tx="tmuxinator"
alias n="nvim --listen /tmp/nvim$(echo $RANDOM | md5sum | cut -c1-8).sock"
alias man="batman"
alias :q="exit"

source <(fzf --zsh)

alias enc="openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 1000000 -salt"

eval "$(zoxide init zsh --cmd cd)"

export EDITOR=nvim

alias backup="packup && rm ~/Documents/packup* && mv ~/packup* ~/Documents/ && rsync --archive --update --copy-links ~/Documents 192.168.0.200:/home/jpporta/ --info=progress2"

# NVM
source /usr/share/nvm/init-nvm.sh

# Scripts
export PATH=$PATH:/home/jpporta/.local/bin

fastfetch

eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh.omp.json)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/jpporta/.lmstudio/bin"
# End of LM Studio CLI section

export SONAR_SCANNER_HOME="/opt/sonar-scanner"
export PATH="${SONAR_SCANNER_HOME}/bin:${PATH}"
