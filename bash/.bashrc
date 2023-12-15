# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

eval "$(oh-my-posh init bash --config ~/.poshthemes/catppuccin.omp.json)"
. "$HOME/.cargo/env"

# Alias definitions
alias aedit='nvim ~/.config/alacritty/alacritty.yml'
alias bashrc='nvim ~/.bashrc'
alias hypr='nvim ~/.config/hypr/hyprland.conf'
alias wisdom='fortune | cowsay'
alias dockerdaemon='sudo systemctl start docker'
alias present='impressive -q -t None'

export EDITOR=nvim
