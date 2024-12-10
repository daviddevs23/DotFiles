if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME=""

# Plugin
plugins=(zsh-syntax-highlighting zsh-autosuggestions)
# source $ZSH/oh-my-zsh.sh

# Starship
eval "$(starship init zsh)"

# Aliases
alias ls="lsd"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -al"
alias vim="nvim"
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
alias convertForResolve="mkdir transcoded; for i in *.mp4; do ffmpeg -i "$i" -vcodec mjpeg -q:v 2 -acodec pcm_s16be -q:a 0 -f mov "transcoded/${i%.*}.mov"; done"
#
# Go to the root of the git folder
git_root() {
    cd $(git rev-parse --show-toplevel)
}
alias gr=git_root
alias update="sudo nixos-rebuild switch"

# git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"

# Source venv quickly
alias sv="source venv/bin/activate"

# docker pull rocm/tensorflow:latest
alias drun='sudo docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --shm-size 16G --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $HOME/dockerx:/dockerx'
# drun rocm/tensorflow:latest

# Path Updates
export PATH="$PATH:$HOME/.local/bin"
