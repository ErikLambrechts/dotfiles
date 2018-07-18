#!//bin/bash
if pgrep -x "espeak" > /dev/null
then
	killall espeak
else
	xsel | espeak -s 300 -v en+f2
fi

