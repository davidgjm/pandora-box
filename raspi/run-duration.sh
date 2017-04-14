#!/bin/bash
if [ $# -lt 2 ]; then
 echo "Invalid arguments!"
 echo "Usage: <duration_in_minutes> <script_path>"
 exit 1
fi

#valiates the duration
if [ $1 -lt 1 ]; then
  echo "Invalid duration. It must be greater than zero."
  exit 1
fi

#Check if the script exists in the file system
if ! test -f $script; then
  echo "Script not found: $script"
  exit 1
fi

duration_in_seconds=$(($1 * 60))
start_time=$(date +%s)
end_time=$(expr $start_time + $duration_in_seconds)

script=$2

echo "About to run script $script for $1 minutes."
echo "Script will run from $(date --date=@$start_time) to $(date --date=@$end_time)"

while [ $start_time -lt $end_time ]; do
  bash -e "$script"
  let start_time=$(date +%s)
done
