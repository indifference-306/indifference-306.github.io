Param(
  [string]$RepoUrl = "https://github.com/USERNAME/REPO.git",
  [string]$Branch = "gh-pages",
  [string]$Message = "Publish site"
)

# 将当前目录内容推送到指定仓库的指定分支（会覆盖该分支）。
# 使用示例：
#   .\deploy.ps1 -RepoUrl https://github.com/yourname/yourrepo.git -Branch gh-pages

git init
git add -A
git commit -m "$Message" 2>$null
git branch -M $Branch
# 如果已存在 origin，更新 URL；否则添加。
if((git remote) -contains 'origin'){
  git remote set-url origin $RepoUrl
}else{
  git remote add origin $RepoUrl
}

git push -u origin $Branch --force
Write-Host "Deployed to $RepoUrl#$Branch"