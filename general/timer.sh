#!/bin/sh

convertsecs() {
 ((m=${1}/60))
 ((s=${1}%60))
 printf "%02d:%02d\n" $m $s
}

# defualt argument
N=${1:-10}

(
for i in  `seq 0 $N`;
do
	p=$((i * 100 / N))
	echo $p
	echo "#" $((N - i)) " to go"; sleep 1;
done
) |
zenity --progress \
  --title="timer" \
  --text="time to go" \
  --percentage=0

if [ "$?" = -1 ] ; then
        zenity --error \
          --text="timer canceled"
fi

