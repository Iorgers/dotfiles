if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /usr/share/nvim/bin
fish_add_path /home/iorgers/.local/bin

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
