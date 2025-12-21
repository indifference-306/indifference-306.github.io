部署到 GitHub Pages（快速说明）

有两种常见发布方式：

1) 用户页面（username.github.io）
   - 创建仓库，命名为 `your-username.github.io`。
   - 将本项目文件推送到仓库的 `main`（或 `master`）分支。
   - 直接访问 https://your-username.github.io

2) 项目页面（使用 gh-pages 分支 或 GitHub Actions）
   - 推荐：使用 GitHub Actions 自动部署（已添加 `.github/workflows/deploy.yml`）。
   - 将此仓库推送到 GitHub（`main` 分支），Actions 会在每次 `push` 到 `main` 时将仓库内容发布到 Pages。

  发布子目录（例如 `dist/`）

  默认 Actions 已配置为发布 `./dist` 目录（通过 `PUBLISH_DIR` 环境变量控制）。如果你的站点构建输出在 `dist/`、`public/` 或其它目录：

  - 在仓库根目录中创建构建脚本（如 `npm run build`）生成输出到 `dist/`。
  - 或者在 `.github/workflows/deploy.yml` 中修改 `env: PUBLISH_DIR` 为你想发布的目录（例如 `./public`）。

  工作流包含一个可选构建步骤：当存在 `package.json` 时会运行 `npm ci` 与 `npm run build`（失败不会中断部署）。

本地手动部署脚本

- Windows PowerShell：`deploy.ps1`。
  示例：
    .\deploy.ps1 -RepoUrl https://github.com/yourname/yourrepo.git -Branch gh-pages

- Bash（macOS / WSL）：`deploy.sh`。
  示例：
    ./deploy.sh https://github.com/yourname/yourrepo.git gh-pages

注意事项
- 脚本会强制覆盖目标分支（`--force`），请谨慎使用。
- 如果你想让网站作为用户/组织页面（username.github.io），请将仓库命名为 `username.github.io` 并推送到 `main` 分支。
- 若使用 GitHub Actions 发布，确保仓库有 Actions 权限（默认开启）。

示例：若你的构建输出在 `public/`，请将 `.github/workflows/deploy.yml` 中的 `PUBLISH_DIR` 修改为 `./public`。

如需我帮你：
- 自动生成 `CNAME` 文件（自定义域名）。
- 配置 GH Actions 仅发布 `dist/` 或某个子目录。  
- 帮你初始化本地 Git 仓库并推送到新的 GitHub 仓库（需要你提供仓库 URL 或凭证）。