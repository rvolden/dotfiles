# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

PS1="\[\e[38;5;43m\]bee\[\e[38;5;157m\]@\[\e[38;5;215m\]hive\[\e[0m\] \[\e[38;5;39m\]\W \[\e[0m\]$ "
alias open='xdg-open'
alias k2so='ssh -X -R 52698:localhost:52698 vulpter@128.114.151.165'
alias sudo='sudo '
alias battery='sudo tlp start && sudo powertop --auto-tune'
alias updoot='yes | sudo dnf update && yes | sudo dnf upgrade --refresh'
alias su='sudo -i'

LS_COLORS=$LS_COLORS:'*.pdf=38;5;227' ; export LS_COLORS
LS_COLORS=$LS_COLORS:'*.fastq=38;5;156' ; export LS_COLORS
LS_COLORS=$LS_COLORS:'*.fasta=38;5;121' ; export LS_COLORS
LS_COLORS=$LS_COLORS:'*.py=38;5;43:' ; export LS_COLORS
LS_COLORS=$LS_COLORS'*.cu=38;5;76:' ; export LS_COLORS
LS_COLORS=$LS_COLORS'*.go=38;5;38:' ; export LS_COLORS
LS_COLORS=$LS_COLORS'*.c=38;5;74:' ; export LS_COLORS
export PATH="$PATH:/home/rvolden/Downloads/depot_tools"

alias pbcopy="xclip -sel clip"
alias cpwd="pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard'"

alias controller='sudo chmod 666 /dev/input/js0'
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Darker-solid'
gsettings set org.gnome.desktop.interface cursor-theme 'bridge'
# User specific aliases and functions
export GOPATH=$HOME/go
export GOBIN=/usr/local/go/bin

