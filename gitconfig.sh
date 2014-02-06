# this can be also configured by file-based config
git config --global alias.aci '!git add -A && git commit'
git config --global alias.ci '!git commit'
git config --global alias.st '!git status -sb'
git config --global alias.co '!git checkout'
git config --global alias.nuke '!git checkout -f && git clean -f -d'
git config --global alias.add-commit-push '!git add -A && git commit && git push'
git config --global color.ui true
git config format.pretty oneline
# make all git pull commands will integrate via git rebase instead of git merge.
git config --global branch.autosetuprebase always
# deny using commands such as push --force  (overwrites the structure and sequence of commits on the authoritative repository, throwing away other people's commits)
git config --global receive.denyNonFastForwards true
