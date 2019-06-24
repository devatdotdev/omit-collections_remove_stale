# Read error_log and remove 'collections_remove_stale' lines
#
# .Dev

# File to watch ('error_log' for apache2)
log="/var/log/apache2/error_log"
staleFile="stale.log"

# Read file line by line
# Use inotifywait to watch the file and omit lines automatically
#

# inotifywait -q -m -e close_write $log |
# (work in progress)

while IFS= read -r line
  do
    # Remove 'collections_remove_stale' lines
    [[ ! $line =~ 'collections_remove_stale' ]] && echo "$line" < "$staleFile"
    # OPTIONAL - create another log file with the omitted results
  done < "$log"
mv o $log