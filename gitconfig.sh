# this can be also configured through file-based config
git config --global push.default simple
git config --global alias.ci '!git add -A && git commit'
git config --global alias.st '!git status -sb'
git config --global alias.co '!git checkout'
git config --global alias.nuke '!git checkout -f && git clean -f -d'
git config --global alias.add-commit-push '!git add -A && git commit && git push'
git config --global color.ui true
# formatting of git log ouput
git config --global format.pretty %Cgreen%ar\ %Cred%h\ %Cblue%aN\ \<%ae\>:\ %Creset%s --graph 
# make all git pull commands will integrate via git rebase instead of git merge.
git config --global branch.autosetuprebase always
# deny using commands such as push --force  (overwrites the structure and sequence of commits on the authoritative repository, throwing away other people's commits)
git config --global receive.denyNonFastForwards true
# list all alises
git config --global alias.aliases '!git config --get-regexp alias'
# always rebase
git config --global alias.pu '!git pull --rebase'
# colorful log
git config --global alias.l '!git log --graph --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)� %an%C(reset)%C(bold yellow)%d%C(reset)" --abbrev-commit --date=relative'
git config --global alias.yesterday '!git l --graph --all --since=day.before.yesterday.midnight --until=midnight'
git config --global alias.today '!git l --graph --all --since=midnight'
