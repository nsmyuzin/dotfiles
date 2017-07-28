# zsh設定
## zsh-completions有効化(補完機能)
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -Uz compinit
compinit
##補完後右左で選択可
zstyle ':completion:*:default' menu select=2
# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'



## zsh.d配下のzshファイルを読み込む
ZSHHOME="${HOME}/.zsh.d"
if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

#historyを共有化
setopt share_history
# historyに重複を表示しない
setopt histignorealldups
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

# プロンプトのレイアウト #
## 左側に表示する部分
PROMPT="%B%F{5}[%*]%f%F{red}%n%F{green}$%d%f%f%b "
## 右側に表示する部分:ブランチ名を色付きで表示させる
### プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
### プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'
##タブタイトルにカレントディレクトリを表示
precmd () {
  echo -ne "\e]2;${PWD}\a"
  echo -ne "\e]1;${PWD:t}\a"
}

#postgrespl設定
export PGDATA=/usr/local/var/postgres

# brewcask保存先設定 usr配下のapplicationsからrootのappへ変更
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
for D in `ls $HOME/.anyenv/envs`
do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
done

#brew path
export PATH=/usr/local/bin:$PATH

#ruby setup


#neovim設定
export XDG_CONFIG_HOME=$HOME/.config
