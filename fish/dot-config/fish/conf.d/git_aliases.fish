# migrating from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh

# ─── Base ─────────────────────────────────────────────────────────────────────
alias g='git'
alias gst='git status'
alias gss='git status -s'
alias gcl='git config --list'

# ─── Diff ─────────────────────────────────────────────────────────────────────
alias gd='git diff'
alias gdc='git diff --cached'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

function gdv
    git diff -w $argv | view -
end

# ─── Add / Reset ──────────────────────────────────────────────────────────────
alias ga='git add'
alias gaa='git add -A'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard; and git clean -dfx'

# ─── Commit ───────────────────────────────────────────────────────────────────
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcam='git commit -am'
alias gcmsg='git commit -m'

# ─── Branch / Checkout ────────────────────────────────────────────────────────
alias gb='git branch'
alias gba='git branch -a'
alias gbn='git --no-pager branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout master'

function gs
    set -l branch (git branch --format='%(refname:short)' | fzf)
    test -n "$branch"; and git checkout $branch
end

# Returns the current branch name
function current_branch
    set -l ref (git symbolic-ref HEAD 2>/dev/null); or set -l ref (git rev-parse --short HEAD 2>/dev/null); or return
    string replace 'refs/heads/' '' -- $ref
end

# ─── Pull / Push ──────────────────────────────────────────────────────────────
alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpoat='git push origin --all; and git push origin --tags'

# these aliases take advantage of current_branch
alias ggpull='git pull origin (current_branch)'
alias ggpur='git pull --rebase origin (current_branch)'
alias ggpush='git push origin (current_branch)'
alias ggpnp='git pull origin (current_branch); and git push origin (current_branch)'

# ─── Remote ───────────────────────────────────────────────────────────────────
alias gr='git remote'
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'

# ─── Rebase / Merge / Cherry-pick ─────────────────────────────────────────────
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grm='git rebase master'
alias gm='git merge'
alias gmt='git mergetool --no-prompt'
alias gcp='git cherry-pick'

# ─── Log ──────────────────────────────────────────────────────────────────────
alias glg='git log --stat --max-count=10'
alias glgg='git log --graph --max-count=10'
alias glgga='git log --graph --decorate --all'
alias glo='git log --oneline'
alias gcount='git shortlog -sn'

function _git_log_prettily
    if test -n "$argv[1]"
        git log --pretty=$argv[1]
    end
end

alias glp='_git_log_prettily'

# ─── Stash ────────────────────────────────────────────────────────────────────
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gsts='git stash show --text'

# ─── Work In Progress ─────────────────────────────────────────────────────────
# These features allow to pause a branch development and switch to another one (wip)
# When you want to go back to work, just unwip it
function work_in_progress
    if git log -n 1 | grep -q -c wip
        echo "WIP!!"
    end
end

alias gwip='git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "wip"'
alias gunwip='git log -n 1 | grep -q -c wip; and git reset HEAD~1'

# ─── Navigation / Misc ────────────────────────────────────────────────────────
# cd into the top of the current repository or submodule
alias grt='cd (git rev-parse --show-toplevel; or echo ".")'
alias ghash='git hash | pbcopy && git hash'

# ─── GitHub CLI ───────────────────────────────────────────────────────────────
alias ghb='gh browse'
alias ghpr='gh pr view -w'

# ─── GUI ──────────────────────────────────────────────────────────────────────
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias gk='gitk --all --branches'

# ─── Git / SVN bridge ─────────────────────────────────────────────────────────
alias git-svn-dcommit-push='git svn dcommit; and git push github master:svntrunk'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'
