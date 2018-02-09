@ECHO OFF
git add .
git status
git commit -am "%*"
git push
