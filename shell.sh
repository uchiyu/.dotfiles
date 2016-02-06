# ログイン後に実行
# change shell
chsh -s /bin/zsh

# relogin
exec $SHELL -l

# load zshrc
source ~/.zshrc
