# Git
type compdef >/dev/null 2>&1 && compdef hub=git
type hub >/dev/null 2>&1 && alias git='hub'
alias ga='git add'
alias gaa='git add --all'
alias gad='git add .'
alias gau='git add -u'
alias gap='git add -p'
alias gapc='git add -p && git commit -v'
alias gapcp='git add -p && git commit -v && git push -u'
alias gapcpr='git add -p && git commit -v && git push -u && hub pull-request && latestpr | rpbcopy'

alias gl='git pull'
alias glr='git pull --rebase'

alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpu='git push -u'

alias grb='git rebase'
alias grbm='git rebase master'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbim='git rebase -i HEAD~$(git log --pretty=oneline master.. | wc -l | tr -d "[:space:]")'

alias gpr='hub pull-request && latestpr | rpbcopy'
alias gprm='git log master.. --format="%B" --reverse > .git/PULLREQ_EDITMSG && git push -u && hub pull-request && latestpr | rpbcopy'

alias gd='git diff'
alias gdh='git diff HEAD'
alias gdh1='git diff HEAD~1'
alias gdc='git diff --cached'
alias gdt='git difftool'

alias gc='git commit -v'
alias gca='git commit -av'
alias gcaa='git commit --amend'
alias gcane='git commit --amend --no-edit'
alias gcaane='git commit -a --amend --no-edit'
alias gcap='git commit -av && git push -u'
alias gcapr='git commit -av && git push -u && hub pull-request && latestpr | rpbcopy'
alias gcp='git commit -v && git push -u'
alias gcpr='git commit -v && git push -u && hub pull-request && latestpr | rpbcopy'
alias gacpr='git add . && git commit -av && git push -u && hub pull-request && latestpr | rpbcopy'

alias gco='git checkout'
alias gcom='git checkout master'
gcopr() { git checkout master; git branch -D pr-$1 2>&1 | grep -v 'not found.'; git fetch origin pull/$1/head:pr-$1 && git checkout pr-$1 }
alias gcl='git clone'
alias gb='git branch'
alias gba='git branch -a'
alias gbdl='git branch -D @{-1}'
alias gbwho="git branch --remote | grep -v master | grep origin | xargs -n1 -J {} sh -c 'git log \$0 | head -2 | tail -1|cut -f2 -d\\  && echo  \$0'|paste -d\" \" - - | sort"
alias gbwhov="git for-each-ref --sort=-committerdate --format='%(committerdate) %(authorname) %(refname)' refs/remotes/origin/|grep -e \".\$@\"|head -n 10"
alias gbmd='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias prune='git remote prune origin'

alias g='git status'
alias gg='git lg'
alias ggg='git ll'
alias ggh='git lg | head'

gra() { git remote add ${2:-"origin"} $1 }
grah() { git remote add $2 git@heroku.com:$1.git }
alias grv='git remote -v'
alias grrm='git remote rm'
alias gru='git remote update'
alias gruo='git remote update origin'

alias gsu='git submodule update --init --recursive'

alias gf='git fetch'
alias gfo='git fetch origin'
alias gtfo='git fetch origin'

alias gs='git stash'
alias gsp='git stash pop'

alias changelog='git log $(git log -1 --format=%H -- CHANGELOG*)..; cat CHANGELOG*'

alias yolo='git commit --amend --no-edit && git push --force-with-lease'
function unyolo() { git checkout master && git branch -D $1 && git remote update origin && git checkout $1 }

alias latestpr='curl -s "https://api.github.com/repos/$(git config --get remote.origin.url | cut -d "/" -f4-)/pulls?state=open&access_token=$(git config ghi.token)" | jq ".[0]._links.html.href" | tr -d \"\\n'

function br() { git checkout -b ${GIT_BRANCH_SUFFIX:-"eb"}-$1 2> /dev/null || git checkout ${GIT_BRANCH_SUFFIX:-"eb"}-$1 }
