#inspired from the Dilbert strip
STRIP_URL=$(curl -s http://xkcd.com/ | awk 'BEGIN { FS="\"" } /^<div id="comic"/ {incomic=1; next; }  incomic && /^<img src=/ {incomic=0; print $2}')

today=$(date +"%m_%d_%Y")
curl -s $STRIP_URL --O $today.png

qlmanage -p $today.png
