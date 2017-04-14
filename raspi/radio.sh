#!/bin/bash

default_list="http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls"
radio=$1
duration=20

if [ $# -lt 1 ]; then
 radio=$default_list
fi

play_for_period() {
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

duration_in_seconds=$(($1 * 60))
start_time=$(date +%s)
end_time=$(expr $start_time + $duration_in_seconds)

echo "About to run script $script for $1 minutes."
echo "Script will run from $(date --date=@$start_time) to $(date --date=@$end_time)"

while [ $start_time -lt $end_time ]; do
  play_simple
  let start_time=$(date +%s)
done
}

play_simple(){
  echo "playing radio $radio"
  mplayer -cache 5120 -cache-min 15 -playlist $radio
}


play(){
 play_for_period $duration 
}

play
