#!/bin/bash
# Usage: ./backup.sh <targetDirectory> <destinationDirectory>
# Archives files in targetDirectory modified in the last 24 hours.

if [[ $# != 2 ]]; then
  echo "Invalid number of parameters"
  echo "Usage: backup.sh targetDirectory destinationDirectory"
  exit 1
fi

targetDirectory=$1
destinationDirectory=$2

echo "Target directory:      $targetDirectory"
echo "Destination directory: $destinationDirectory"

currentTS=$(date +%s)
backupFileName="backup-$currentTS.tar.gz"

origAbsPath=$(pwd)
cd "$destinationDirectory" || exit 1
destAbsPath=$(pwd)

cd "$origAbsPath" || exit 1
cd "$targetDirectory" || exit 1

yesterdayTS=$((currentTS - 24 * 60 * 60))

declare -a toBackup

for file in *; do
  [[ -f $file ]] || continue
  if (( $(date -r "$file" +%s) > yesterdayTS )); then
    toBackup+=("$file")
  fi
done

if (( ${#toBackup[@]} == 0 )); then
  echo "No files modified in the last 24 hours."
  exit 0
fi

tar -czvf "$backupFileName" "${toBackup[@]}"
mv "$backupFileName" "$destAbsPath"
echo "Backup created: $destAbsPath/$backupFileName"
