#!/bin/bash

debug()
{
    echo -e "\nDebug output starts"
    echo $is_success
    # echo $backup
    echo -e "\nDebug output ends"
}

upload()
{
    git add .

    echo -e "\nWhat changes did you make since the last time you uploaded?"
    read commit_message
    git commit -m "$commit_message"
    git push

    echo -e "\nSuccessfully uploaded all changes (if any!)"
}

download()
{
    git fetch
    git pull
    
    echo -e "\nSuccessfully downloaded all changes (if any!)"
}

refresh()
{
    # for output in $(git branch)
    # do
    #     echo "Output is "
    # done
    
    upload
    download
}


echo -e "\nWhat would you like to do?"
echo -e "1. Refresh everything"
echo -e "2. Upload all changes"
echo -e "3. Download new changes"

read choice

case $choice in
    1)
        refresh
        ;;

    2)
        upload
        ;;

    3)
        download
        ;;
esac