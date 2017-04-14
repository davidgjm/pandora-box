#!/bin/bash
if [ $# -lt 2 ]; then
 echo "Invalid arguments!"
 echo "Usage: <duration_in_minutes> <command>"
 exit 1
fi

#valiates the duration
if [ $1 -lt 1 ]; then
  echo "Invalid duration. It must be greater than zero."
  exit 1
fi

#Check if the command exists in the file system
if test -z $2; then
  echo "Script not found: $command"
  exit 1
fi

duration_in_seconds=$(($1 * 60))
start_time=$(date +%s)
end_time=$(expr $start_time + $duration_in_seconds)

command=$2

echo "About to run command $command for $1 minutes."
echo "Script will run from $(date --date=@$start_time) to $(date --date=@$end_time)"

while [ $start_time -lt $end_time ]; do
  `$command`
  let start_time=$(date +%s)
done
