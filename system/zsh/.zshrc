if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME=""

# Plugin
plugins=(zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Starship
eval "$(starship init zsh)"

# Aliases
alias ls="lsd"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -al"
alias vim="nvim"
alias vpn="f5fpc --start --host https://vpn.mtu.edu --user dehochst -x"
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
alias mine="xmrig --donate-level 5 -o xmr-eu1.nanopool.org:14433 -u 42VHNrVBTK95LvdyhfdSVegPfSHL4N7oeLDCiT7kjER3W8TjXQ4YfoVFuLhXPoXH4j9Fv31fEVnVKASuV6hA71cMLSgHNKm --tls -t 16 --coin monero"
alias convertForResolve="mkdir transcoded; for i in *.mp4; do ffmpeg -i "$i" -vcodec mjpeg -q:v 2 -acodec pcm_s16be -q:a 0 -f mov "transcoded/${i%.*}.mov"; done"

# Path Updates
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/rocm/bin/"
