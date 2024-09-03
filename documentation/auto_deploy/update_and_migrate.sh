#!/bin/bash

LOGFILE="/home/frappe/updateLMS.log"

# Timestamp for the start of the script
script_start_time=$(date +"%Y-%m-%d %H:%M:%S")
start_time=$(date +%s)

# Navigate to the app directory
cd /home/frappe/frappe-bench/apps/library_management_system/

# Fetch the latest changes from the remote
git fetch upstream

# Check for changes between local and remote branches
if [ -n "$(git log HEAD..upstream/main --oneline)" ]; then
    # There are changes on the remote branch
    echo "$script_start_time: Remote changes found" >> $LOGFILE
    
    # Pull the changes
    git pull upstream main
    
    # Time the bench migrate command
    migrate_start_time=$(date +%s)
    time bench --site hsrai.ukiericoncretecongress.com migrate
    migrate_end_time=$(date +%s)
    
    # Calculate the duration of the bench migrate
    migrate_duration=$((migrate_end_time - migrate_start_time))
    
    echo "$script_start_time: Total time taken for bench migrate: $migrate_duration seconds" >> $LOGFILE
else
    # No changes found on the remote branch
    echo "$script_start_time: No remote changes found" >> $LOGFILE
fi

# Timestamp for the end of the script
script_end_time=$(date +%s)
total_duration=$((script_end_time - start_time))
script_end_time_formatted=$(date -d @$script_end_time +"%Y-%m-%d %H:%M:%S")

echo "$script_start_time: Script completed at $script_end_time_formatted. Total time taken: $total_duration seconds" >> $LOGFILE
