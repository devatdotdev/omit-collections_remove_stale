# Read error_log and remove 'collections_remove_stale' lines
#
# .Dev

# File to watch ('error_log' for apache2)
log="/var/log/apache2/error_log"

# Read file line by line
inotifywait -q -m -e close_write $log |
while IFS= read -r line
  do
    # Remove 'collections_remove_stale' lines
    [[ ! $line =~ 'collections_remove_stale' ]] && echo "$line"
    # OPTIONAL - create another log file with the omitted results
  done <log > o
mv o $log