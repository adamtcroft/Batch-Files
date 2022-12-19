#!bin/zsh
curl --url https://dlcf.reaper.fm/6.x/reaper${1}_universal.dmg --output /Users/adam/Desktop/reaper${1}.dmg && open -W /Users/adam/Desktop/reaper${1}.dmg && rm /Users/adam/Desktop/reaper${1}.dmg
