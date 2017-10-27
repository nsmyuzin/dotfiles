#基本的なエイリアス
alias cdh="cd ~/"
alias cdd="cd ../"
alias cddd="cd ../../"
alias cdddd="cd ../../../"
alias ll="ls -alh"

alias pgs="pg_ctl -l /usr/local/var/postgres/server.log start" #postgresql 起動
alias pge="pg_ctl stop" #postgresql 終了

alias mss="mysql.server start" #mysql 起動
alias mse="mysql.server stop" #mysql 終了

#bundle init 実行後railsを記入
alias bis="bundle init"

#bundle install
alias bil="bundle install --path vendor/bundle --binstubs=bundle_bin"

#Rails start
alias rainew="bundle exec rails new . -TB --database=postgresql -B"

#gitコマンド
alias s="git status"
alias d="git diff"
