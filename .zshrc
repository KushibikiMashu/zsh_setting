# Created by newuser for 5.6.2
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
PATH="$PATH:~/bin"
source ~/.bashrc

# 自動補完を有効にする
# コマンドの引数やパス名を途中まで入力して <Tab> を押すといい感じに補完してくれる
# 例： `cd path/to/<Tab>`, `ls -<Tab>`
autoload -U compinit; compinit

# 入力したコマンドが存在せず、かつディレクトリ名と一致するなら、ディレクトリに cd する
# 例： /usr/bin と入力すると /usr/bin ディレクトリに移動
setopt auto_cd

# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd

# docker関係
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias ds='docker stats'
alias dp='docker ps'
alias dpa='docker ps -a'
alias de='docker exec -ti'
alias dephp='docker exec -ti hiphop_station_phpfpm_1 sh'

# 汎用
alias p='cd ~/projects'
alias hip='~/projects/php/hiphop_station'

# Git
alias st='git status'
alias df='git diff'
alias ad='git add .'
alias com='git commit -m'
alias ch='git checkout'
alias push='git push origin'
alias pull='git pull origin'

# rails
alias r='rails'
alias mig='rails g migration'
alias ber='bundle exec rspec'

# VCSの情報を取得するzsh関数
autoload -Uz vcs_info
autoload -Uz colors # black red green yellow blue magenta cyan white
colors

# PROMPT変数内で変数参照
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{red}com " #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{red}add " #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{red}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

# %b ブランチ情報
# %a アクション名(mergeなど)
# %c changes
# %u uncommit

# プロンプト表示直前に vcs_info 呼び出し
precmd () { vcs_info }

# プロンプト（左）
PROMPT=$'%{${fg[white]}%}[%~]\n$ %{${reset_color}%}'

# プロンプト（右）
RPROMPT='${vcs_info_msg_0_} %{${fg[red]}%}%}%{${reset_color}%} '
