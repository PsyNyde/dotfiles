time=`date +%Y-%m-%d-%H-%M-%S`
geometry=`xrandr | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current'`
dir="$HOME/Pictures/Screenshots"
file="Screenshot_${time}_${geometry}.jpeg"
grim -c -t jpeg -q 100 ${dir}/${file} && notify-send --replace-id=699 -u low "Screenshot" "Saved at ${dir}/$2" -i ${dir}/$file && viewnior ${dir}/${file}
