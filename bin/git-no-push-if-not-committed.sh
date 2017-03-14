#!/bin/bash
#
# This script prevents git from pushing if you have an uncommitted changes.
#
# 1) Copy this file to .git/hooks/pre-push
# 2) chmod +x pre-push
#

git diff --quiet
STATUS=$?

if [ $STATUS = 1 ]; then
  echo -e "\033[0;31mPUSH ABORTED\033[0;29m: You have uncommitted changes   (override with --no-verify)"
  echo ""

  git status
fi

exit $STATUS
