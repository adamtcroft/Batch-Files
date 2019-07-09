@ECHO OFF
git add .
git status
git commit -m "%*"
git push
