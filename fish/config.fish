if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # remove greeting
    set -g fish_greeting

    function fish_user_key_bindings
        fish_default_key_bindings -M insert
        fish_vi_key_bindings --no-erase insert
    end

    # Powerline
    starship init fish | source

    # Path
    fish_add_path -g "$HOME/.local/bin/"
    fish_add_path -g "$HOME/Documents/isabelle/isabelle-emacs/bin/"
    #fish_add_path -g "$HOME/.cargo/bin/"

    # alias
    alias ls "ls --color=auto"
    alias grep "grep --color=auto"

    alias hacked "cmatrix -s -M 'You\'ve been hacked ¯\\_(ツ)_/¯'"
    alias wisdom "fortune | cowsay"
    alias present "impressive -q -t None"
    alias clock "tty-clock -c -C 3"
    alias ranger "yazi"

    alias daniel "sudo xxd /dev/nvme1n1 | less"
    alias deb "sudo docker run -ti --rm debian:latest bash"

    # Env
    set -gx EDITOR nvim
    # prevents nmtui from destroying my eyes (https://lemmy.ml/post/18134220)
    set -gx NEWT_COLORS 'root=black,black;window=black,black;border=white,black;listbox=white,black;label=blue,black;checkbox=red,black;title=green,black;button=white,red;actsellistbox=white,red;actlistbox=white,gray;compactbutton=white,gray;actcheckbox=white,blue;entry=lightgray,black;textbox=blue,black'
end
