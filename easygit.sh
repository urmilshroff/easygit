#!/bin/bash

debug()
{
    echo "Debug output starts"
    # echo $is_success
    echo $backup
    echo "Debug output ends"
}

upload()
{
    git add .
    
    echo "What changes did you make since the last time you uploaded?"
    read commit_message
    git commit -m "$commit_message"

    # is_success=$(git push | head -1)
    backup=$(tmutil listlocalsnapshots / | head -1)
    debug
    echo $is_success

    if [ $is_success = "nothing to commit, working tree clean" ]
    then
        echo "Nothing new to push!"

    else
        echo "Successfully uploaded all changes!"
    fi
}

download()
{
    git fetch
    git pull
}

refresh()
{
    for output in $(git branch)
    do
        echo "Output is "
    done
}


echo -e "\nWhat would you like to do?\n1. Refresh everything \n2. Upload all changes\n3. Download new changes"
read choice

case $choice in
    1)
        refresh
        ;;

    2)
        upload
        ;;
esac