#!/usr/bin/env bash

mplayer -noconsolecontrols -really-quiet -vo null -cache 2018 -cache-min 10 -playlist http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls &
bg_pid=$!
echo $bg_pid > ~/mplayer.pid
sleep 120

echo "Time is up. Stopping radio..."
kill $bg_pid
