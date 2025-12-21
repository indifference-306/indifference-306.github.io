#!/usr/bin/env bash
REPO_URL=${1:-"https://github.com/USERNAME/REPO.git"}
BRANCH=${2:-gh-pages}
MSG=${3:-"Publish site"}

# 将当前目录内容推送到指定仓库的指定分支（会覆盖该分支）。
# 使用示例： ./deploy.sh https://github.com/yourname/yourrepo.git gh-pages

git init
git add -A
git commit -m "$MSG" || true
git branch -M $BRANCH
if git remote | grep -q origin; then
  git remote set-url origin "$REPO_URL"
else
  git remote add origin "$REPO_URL"
fi

git push -u origin $BRANCH --force
echo "Deployed to $REPO_URL#$BRANCH"