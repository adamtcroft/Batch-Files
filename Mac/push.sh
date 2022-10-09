#!bin/zsh
currentDate=date +%H\:%M\ %D
git add .
git commit -m "update $date"
git push
