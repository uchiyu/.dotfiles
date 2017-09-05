#=======================================================================
#
#基本設定
#=======================================================================
# 環境変数 パスの設定
export LANG=ja_JP.UTF-8
export PATH=$HOME/local/bin:$PATH

# 履歴周りの設定
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

#重複を記録しない
 setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

#-----------------------------------------------------------------------
#色彩関連の設定
#-----------------------------------------------------------------------
# 色を使用出来るようにする
autoload colors
colors

### Ls Color ###
# 色の設定
### Prompt ####
# 2行表示
PROMPT="%{${fg[green]}%}[%n@%m] %{${fg[cyan]}%}%~
%{${reset_color}%}%# "
# vim/emacsキーバインドにする
bindkey -v #-e

#--------------------------------------------------
# ヒストリの設定
#--------------------------------------------------

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }

#--------------------------------------------------
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# beep を無効にする
setopt no_beep
 
# フローコントロールを無効にする
setopt no_flow_control
 
# Ctrl+Dでzshを終了しない
setopt ignore_eof
 
# '#' 以降をコメントとして扱う
setopt interactive_comments
 
# ディレクトリ名だけでcdする
setopt auto_cd
 
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
 
# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
 
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
 
# 高機能なワイルドカード展開を使用する
setopt extended_glob

# コマンドミスを修正
setopt correct

#--------------------------------------------------
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# pecoで履歴の検索をスムーズに
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

#--------------------------------------------------
# エイリアス
#alias ls='ls --color=auto'
alias 'ls -a'='ls -a -G'
alias la='ls -a'
alias ll='ls -l'
alias mkdir='mkdir -p'
alias cd...='cd ../../'
alias cd....='cd ../../../'
alias be='bundle exec'

# javacの文字化け防止
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '
 
# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# vimの設定
alias v='vim'
alias vf='vim +VimFiler'

#=======================================================================
#補完機能の設定
#=======================================================================
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

# bundle execを使わない設定
which direnv > /dev/null && eval "$(direnv hook zsh)"

#=======================================================================
# git関連
#=======================================================================
RPROMPT=$'`branch-status-check`'
# 表示毎にPROMPTで設定されている文字列を評価する
setopt prompt_subst
# fg[color]表記と$reset_colorを使いたい
# @see https://wiki.archlinux.org/index.php/zsh
function branch-status-check() {
    local branchname suffix
    # .gitの中だから除外
    [[ '$PWD' =~ '/\.git(/.*)?$' ]] && return
    branchname=`get-branch-name`
    # ブランチ名が無いので除外
    [[ -z $branchname ]] && return
    suffix='%{'${reset_color}'%}'
    echo `get-branch-status`${suffix}
}
function get-branch-name() {
    local git==git
    # gitディレクトリじゃない場合のエラーを捨てる
    echo `${git} rev-parse --abbrev-ref HEAD 2> /dev/null`
}
function get-branch-status() {
    local git==git branchstatus branchname
    branchname=`get-branch-name`
    output=`${git} status 2> /dev/null`
    if [[ -n `echo $output | grep '^nothing to commit'` ]]; then
        branchstatus='%{'${fg[green]}'%}%{'${fg[black]}${bg[green]}'%}  '${branchname}
    elif [[ -n `echo $output | grep '^Untracked files:'` ]]; then
        branchstatus='%{'${fg[yellow]}'%}%{'${fg[black]}${bg[yellow]}'%}  '${branchname}
    elif [[ -n `echo $output | grep '^Changes not staged for commit:'` ]]; then
        branchstatus='%{'${fg[red]}'%}%{'${fg[black]}${bg[red]}'%}  '${branchname}
    else
        branchstatus='%{'${fg[cyan]}'%}%{'${fg[black]}${bg[cyan]}'%}  '${branchname}
    fi
    echo ${branchstatus}' '
}

source ~/.zshenv
