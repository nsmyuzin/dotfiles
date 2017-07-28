# brew cask upgrade function
brew-cask-upgrade(){
for app in $(brew cask list)
do local latest="$(brew cask info "${app}" | awk 'NR==1{print $2}')"
  local versions=($(ls -1 "/usr/local/Caskroom/${app}/.metadata/"))
  local current=$(echo ${versions} | awk '{print $NF}')
  if [[ "${latest}" = "latest" ]]
  then echo "[!] ${app}: ${current} == ${latest}"
    [[ "$1" = "-f" ]] && brew cask install "${app}" --force
    continue
  elif [[ "${current}" = "${latest}" ]]
  then continue
  fi
  echo "[+] ${app}: ${current} -> ${latest}"
  brew cask uninstall "${app}" --force
  brew cask install "${app}"
done
 }

 # opensslのシンボリックリンクを更新する機能追加
 my-openssl-upgrade(){
 local new_openssl="$(ls /usr/local/Cellar/openssl/ | tail -1)"
 ln -nfs /usr/local/Cellar/openssl/"${new_openssl}"/bin/openssl /usr/local/bin/openssl
}


## 右側に表示する部分:ブランチ名を色付きで表示させる
rprompt-git-current-branch(){
local branch_name st branch_status
if [ ! -e  ".git" ]; then
  # gitで管理されていないディレクトリは何も返さない
  return
fi
branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
st=`git status 2> /dev/null`
if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
  # 全てcommitされてクリーンな状態
  branch_status="%F{green}"
elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
  # gitに管理されていないファイルがある状態
  branch_status="%F{red}?"
elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
  # git addされていないファイルがある状態
  branch_status="%F{red}+"
elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
  # git commitされていないファイルがある状態
  branch_status="%F{yellow}!"
elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
  # コンフリクトが起こった状態
  echo "%F{red}!(no branch)"
  return
else
  # 上記以外の状態の場合は青色で表示させる
  branch_status="%F{blue}"
fi
# ブランチ名を色付きで表示する
echo "${branch_status}[$branch_name]"
}
