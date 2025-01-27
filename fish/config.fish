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

    # better cd
    zoxide init fish --cmd d | source

    # Path
    fish_add_path -g "$HOME/.local/bin/"
    fish_add_path -g "$HOME/Documents/isabelle/isabelle-emacs/bin/"
    #fish_add_path -g "$HOME/.cargo/bin/"

    # TeX Live
    fish_add_path -g "$HOME/.local/texlive/2024/bin/x86_64-linux/"
    set -gx MANPATH $MANPATH "$HOME/.local/texlive/2024/texmf-dist/doc/man/"
    set -gx INFOPATH $INFOPATH "$HOME/.local/texlive/2024/texmf-dist/doc/info/"

    # alias
    alias ls "ls --color=auto"
    alias grep "grep --color=auto"
    alias ranger yy
    alias present "impressive -q -t None"

    # fun stuff
    alias clock "tty-clock -c -C 3"
    alias wisdom "fortune | cowsay"

    # Env
    set -gx EDITOR nvim
    # prevents nmtui from destroying my eyes (https://lemmy.ml/post/18134220)
    set -gx NEWT_COLORS 'root=black,black;window=black,black;border=white,black;listbox=white,black;label=blue,black;checkbox=red,black;title=green,black;button=white,red;actsellistbox=white,red;actlistbox=white,gray;compactbutton=white,gray;actcheckbox=white,blue;entry=lightgray,black;textbox=blue,black'
end
