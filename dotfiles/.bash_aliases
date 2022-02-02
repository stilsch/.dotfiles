function extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


# APT
function apt-history(){
      case "$1" in
        install)
              cat /var/log/dpkg.log | grep 'install '
              ;;
        upgrade|remove)
              cat /var/log/dpkg.log | grep $1
              ;;
        rollback)
              cat /var/log/dpkg.log | grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}

function inst () {
    sudo apt-get update 
    sudo apt-get install $* && echo $1 >> ~/.installations.log
}
alias se="sudo apt-cache search  $1"

# BASH
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi
alias ll='ls -alhF'
alias h='history'
alias ducks='du -cks * | sort -rn | head -11'
alias xscreen="screen -d; screen -d; screen -r"
alias sync_Bilder_to_osmc="rsync  -av --no-perms --no-owner --no-group  --progress   --exclude _gsdata_ --exclude _Baustelle /data/Bilder/Fotos_Steffen/ -e ssh osmc:Fotos_Steffen/"
# Proxmox
alias update_containers="pct list | grep running | awk '{print "pct exec "$1" -- bash -c \"apt update && apt upgrade -y \" "}'   | sh -x"

#ARBEIT
alias sy051="ssh stilsch@10.10.1.20"
alias sy052="ssh stilsch@10.10.1.21"
alias sy061="ssh stilsch@10.10.1.26"
alias sy062="ssh stilsch@10.10.1.27"
alias sy251="ssh stilsch@10.10.1.22"
alias sy252="ssh stilsch@10.10.1.23"
alias sy053="rdesktop -K -ustilsch -dSAPMD -z 10.10.1.12 -P -a 16 -g 1800x1024 -r clipboard:PRIMARYCLIPBOARD"
alias sy054="rdesktop -K -ustilsch -dSAPMD -z 10.10.1.13 -P -a 16 -g 1800x1024 -r clipboard:PRIMARYCLIPBOARD"
alias sy253="rdesktop -K -ustilsch -dSAPMD -z 10.10.1.14 -P -a 16 -g 1800x1024 -r clipboard:PRIMARYCLIPBOARD"
alias sy254="rdesktop -K -ustilsch -dSAPMD -z 10.10.1.15 -P -a 16 -g 1800x1024 -r clipboard:PRIMARYCLIPBOARD"
alias hwts1="rdesktop -K -uA333773 -dEMEA1 -z 10.10.1.10 -P -a 16 -g 1800x1024 -r clipboard:PRIMARYCLIPBOARD -r disk:share=/home/steffen/Schreibtisch"
alias hwts2="rdesktop -K -uA333773 -dEMEA1 -z 10.10.1.11 -P -a 16 -g 1800x1024 -r clipboard:PRIMARYCLIPBOARD -r disk:share=/home/steffen/Schreibtisch"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

function gitup () {
 if [ -f $1 ] ; then
   git add $1
   git commit -m "$2"
   git push -u origin main
 fi
}
