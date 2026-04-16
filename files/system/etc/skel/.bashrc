# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
echo ""
echo "AtomiXP [Version 6.7.69420]"
echo "(C) Copyright 2025 AtomiXP Project"
echo ""

PS1='\n\[\e[37m\]$(pwd | sed "s|^$HOME|C:\\\\Users\\\\$USER|;s|/|\\\\|g;s|^[^C]|C:\\\\|")\[\e[0m\]> '

# User specific aliases and functions