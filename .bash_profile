# Set custom prompt showing current branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Set custom terminal window title
# https://github.com/zeit/hyper/issues/1188#issuecomment-267301723
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
    show_command_in_title_bar()
    {
        case "$BASH_COMMAND" in
            *\033]0*)
                ;;
            *)
                echo -ne "\033]0;${BASH_COMMAND} - ${PWD##*/}\007"
                ;;
        esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
*)
    ;;
esac

alias c="code ."

alias bshedit="code ~/.bash_profile"
alias bshupdate="source ~/.bash_profile"

alias r="npm run"

alias git=hub
alias gb="git branch"
alias gp="git pull"
alias gpush="git push"
alias gst="git status"
alias gco="git checkout"
alias gc="git commit"
alias gca="git commit -a -m"
alias grpush="git push -u origin HEAD"
alias glog="git log --pretty=oneline --abbrev-commit"
alias gamend="git commit --amend --no-edit"
alias grc="git rebase --continue"
alias grs="git rebase --skip"
alias gundo="git reset HEAD~1"
alias gps="git pr show"
