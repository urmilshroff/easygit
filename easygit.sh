#!/bin/bash

echo -e "\nWhat would you like to do?\n1. Upload all changes\n2. Download new changes"
read choice

upload()
{
    git add .
    echo "What changes did you make since the last time you uploaded?"
    read commit_message
    git commit -m "$commit_message"
    git push
    echo "Successfully uploaded changed files!"
}

download()
{
    git fetch
    git pull
}

case $choice in
    1)
        upload
        ;;

    2)
        download
        ;;
esac