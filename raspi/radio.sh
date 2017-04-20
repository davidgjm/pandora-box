#!/bin/bash

default_list="http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls"
radio=$default_list
duration=2

if [ $# -lt 1 ]; then
 radio=$default_list
fi

if [ $# -lt 1 ]; then
 echo "Invalid arguments!"
 echo "Usage: <duration_in_minutes>"
 exit 1
fi

#valiates the duration
if [ $1 -lt 1 ]; then
  echo "Invalid duration. It must be greater than zero."
  exit 1
fi

#duration in seconds. The argument value is in minutes.
duration=$(($1 * 60))

#Add additional 30 seconds for buffering
echo "About to play radio for $1 minutes."


echo "playing radio $radio"

mplayer -noconsolecontrols -playlist $radio &
#mplayer -noconsolecontrols -vo null -really-quiet -cache 2048 -cache-min 15 -playlist $radio &
#mplayer -noconsolecontrols -vo null  -cache 2048 -cache-min 15 -playlist $radio &
pid=$!
echo "Running in the background with pid $pid"
sleep $duration
echo "Time is up. Stopping radio pid=$pid..."
kill $pid

