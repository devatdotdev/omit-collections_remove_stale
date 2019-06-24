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

# read file line by line IFS is to prevent whitespace trimming
while IFS= read -r line
  do
    # Remove 'collections_remove_stale' lines && log the removed entries to another file
    [[ ! $line =~ 'collections_remove_stale' ]] && echo "$line" > $staleFile
  done < "$log"