#!/bin/sh

backup_dir=/home/backup/histories
logfile=/home/backup/histories.log

file_extensions=(
"zsh_history"
"python_history"
"zsh_history"
"xsesstion-errors"
)

for extension in "${file_extensions[@]}"; do 
     files=$(find ~ -type f -name "*.$extension") 
     if [ -z "$files" ]; then
         echo "$(date): No files found with extension '$extension' in the home directory." >> $logfile
    else
        tarball_name="$(date +%Y-%m-%d_%H-%M-%S)_$extension.tar.gz"
        tar -czvf "$backup_dir/$tarball_name" $files
    fi
done
