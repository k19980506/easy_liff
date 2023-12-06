!/usr/bin/env sh

# 錯誤中止
set -e

# 打包
npm run build

cd dist

# git init
# git add -A
# git commit -m 'deploy'

# 部署到 https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# 部署到 https://<USERNAME>.github.io/<REPO>
# git push -f https://github.com/ayay459547/easy_liff master:gh-pages

cd -