#=======================================================================
#$B4pK\@_Dj(B
#=======================================================================
# $B4D6-JQ?t(B
export LANG=ja_JP.UTF-8

#-----------------------------------------------------------------------
#$B?':L4XO"$N@_Dj(B
#-----------------------------------------------------------------------
# $B?'$r;HMQ=PMh$k$h$&$K$9$k(B
autoload colors
colors

### Ls Color ###
# $B?'$N@_Dj(B
### Prompt ####
# 2$B9TI=<((B
PROMPT="%{${fg[green]}%}[%n@%m] %{${fg[cyan]}%}%~
%{${reset_color}%}%# "
# vim/emacs$B%-!<%P%$%s%I$K$9$k(B
bindkey -v #-e

#--------------------------------------------------
# $B%R%9%H%j$N@_Dj(B
#--------------------------------------------------

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt bang_hist          # !$B$r;H$C$?%R%9%H%jE83+$r9T$&(B(d)
setopt extended_history   # $B%R%9%H%j$K<B9T;~4V$bJ]B8$9$k(B
setopt hist_ignore_dups   # $BD>A0$HF1$8%3%^%s%I$O%R%9%H%j$KDI2C$7$J$$(B
setopt share_history      # $BB>$N%7%'%k$N%R%9%H%j$r%j%"%k%?%$%`$G6&M-$9$k(B
setopt hist_reduce_blanks # $BM>J,$J%9%Z!<%9$r:o=|$7$F%R%9%H%j$KJ]B8$9$k(B
# $B%^%C%A$7$?%3%^%s%I$N%R%9%H%j$rI=<($G$-$k$h$&$K$9$k(B
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# $B$9$Y$F$N%R%9%H%j$rI=<($9$k(B
function history-all { history -E 1 }

#--------------------------------------------------
# $B%*%W%7%g%s(B
# $BF|K\8l%U%!%$%kL>$rI=<(2DG=$K$9$k(B
setopt print_eight_bit
 
# beep $B$rL58z$K$9$k(B
setopt no_beep
 
# $B%U%m!<%3%s%H%m!<%k$rL58z$K$9$k(B
setopt no_flow_control
 
# Ctrl+D$B$G(Bzsh$B$r=*N;$7$J$$(B
setopt ignore_eof
 
# '#' $B0J9_$r%3%a%s%H$H$7$F07$&(B
setopt interactive_comments
 
# $B%G%#%l%/%H%jL>$@$1$G(Bcd$B$9$k(B
setopt auto_cd
 
# cd $B$7$?$i<+F0E*$K(Bpushd$B$9$k(B
setopt auto_pushd
# $B=EJ#$7$?%G%#%l%/%H%j$rDI2C$7$J$$(B
setopt pushd_ignore_dups
 
# $BF1;~$K5/F0$7$?(Bzsh$B$N4V$G%R%9%H%j$r6&M-$9$k(B
setopt share_history
 
# $BF1$8%3%^%s%I$r%R%9%H%j$K;D$5$J$$(B
setopt hist_ignore_all_dups
 
# $B%9%Z!<%9$+$i;O$^$k%3%^%s%I9T$O%R%9%H%j$K;D$5$J$$(B
setopt hist_ignore_space
 
# $B%R%9%H%j$KJ]B8$9$k$H$-$KM>J,$J%9%Z!<%9$r:o=|$9$k(B
setopt hist_reduce_blanks
 
# $B9b5!G=$J%o%$%k%I%+!<%IE83+$r;HMQ$9$k(B
setopt extended_glob
 
#--------------------------------------------------
# $B%-!<%P%$%s%I(B
 
# ^R $B$GMzNr8!:w$r$9$k$H$-$K(B * $B$G%o%$%k%I%+!<%I$r;HMQ=PMh$k$h$&$K$9$k(B
bindkey '^R' history-incremental-pattern-search-backward
 
#--------------------------------------------------
# $B%(%$%j%"%9(B

alias la='ls -a'
alias ll='ls -l'
alias mkdir='mkdir -p'
alias cd...='cd ../../'
alias cd....='cd ../../../'

alias v='vim'
 
# sudo $B$N8e$N%3%^%s%I$G%(%$%j%"%9$rM-8z$K$9$k(B
alias sudo='sudo '
 
# $B%0%m!<%P%k%(%$%j%"%9(B
alias -g L='| less'
alias -g G='| grep'

#=======================================================================
#$BJd405!G=$N@_Dj(B
#=======================================================================
# $BJd405!G=$rM-8z$K$9$k(B
autoload -Uz compinit
compinit

# $BJd40$G>.J8;z$G$bBgJ8;z$K%^%C%A$5$;$k(B
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ $B$N8e$O:#$$$k%G%#%l%/%H%j$rJd40$7$J$$(B
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo $B$N8e$m$G%3%^%s%IL>$rJd40$9$k(B
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

### Complement ###
autoload -U compinit; compinit # $BJd405!G=$rM-8z$K$9$k(B
setopt auto_list               # $BJd408uJd$r0lMw$GI=<($9$k(B(d)
setopt auto_menu               # $BJd40%-!<O"BG$GJd408uJd$r=g$KI=<($9$k(B(d)
setopt list_packed             # $BJd408uJd$r$G$-$k$@$15M$a$FI=<($9$k(B
setopt list_types              # $BJd408uJd$K%U%!%$%k$N<oN`$bI=<($9$k(B
bindkey "^[[Z" reverse-menu-complete  # Shift-Tab$B$GJd408uJd$r5U=g$9$k(B("\e[Z"$B$G$bF0:n$9$k(B)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # $BJd40;~$KBgJ8;z>.J8;z$r6hJL$7$J$$(B

#=======================================================================
# $B9bB.$J%G%#%l%/%H%j0\F0(B 
#  http://qiita.com/maxmellon/items/23325c22581e9187639e
#=======================================================================
#-----------------------------------------------------------------------
#zsh$B$N(Bhistory$B$H(Bpeco$B$NO"7H(B
#function peco-select-history() {
#    local tac
#    if which tac > /dev/null; then
#        tac="tac"
#    else
#        tac="tail -r"
#    fi
#
#    BUFFER=$(\history -n 1 | \
#        eval $tac | \
#        peco --query "$LBUFFER")
#    CURSOR=$#BUFFER
#    zle clear-screen
#}
#zle -N peco-select-history
#bindkey '^r' peco-select-history
#
## $B%f!<%6!<%G%#%l%/%H%jFb$K%$%s%9%H!<%k$7$?>l9g$O(BPATH$B$r@_Dj(B
#PATH=$PATH:~/local/bin/
#export PATH=$PATH:~/local/bin/
#
##-----------------------------------------------------------------------
##$B%G%#%l%/%H%j0\F0$K:]$7$F$N@_Dj(B
#function peco-z-search
#{
#  which peco z > /dev/null
#  if [ $? -ne 0 ]; then
#    echo "Please install peco and z"
#    return 1
#  fi
#  local res=$(z | sort -rn | cut -c 12- | peco)
#  if [ -n "$res" ]; then
#    BUFFER+="cd $res"
#    zle accept-line
#  else
#    return 1
#  fi
#}
#zle -N peco-z-search
#bindkey '^f' peco-z-search

source ~/.zsh.d/z.sh

