@ECHO OFF
set mydate=%date:~4%
set mytime=%time:~0,8%
git pull
git add .
git commit -m "Update %mydate% %mytime%"
git push
