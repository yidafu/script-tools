#!/usr/bin/env bash

# pull all repository diretories with current branch in specific directory
# 
# best partner is crontab.
# you can set a timer to run this script at 9 am every days.
# 0 9 * * * ./pull-repos.sh

dest_dir="${GITLAB_DIR:-$HOME/gitlab}/*"

log_file="${HOME}/.git-pull-history.log"

touch $log_file

echo -e "\033[32mI will fetch all repo under ${dest_dir}.\033[0m" >> $log_file
echo -e "\033[32mstarting sync repo...\033[0m" >> $log_file
echo "" >> $log_file

for file in $dest_dir
do
    if test -d $file && test -e $file/.git
    then
        git_current_branch=$(git rev-parse --abbrev-ref HEAD) >> $log_file
        echo -e "\033[33m    pulling origin $git_current_branch in $file\033[0m" >> $log_file
        cd $file && git pull origin $git_current_branch >> $log_file
    else
        echo -e "\033[30m    Ingore $file\033[0m" >> $log_file
    fi
done

echo ""
echo -e "\033[32mFinish sync git repo!\033[0m" >> $log_file