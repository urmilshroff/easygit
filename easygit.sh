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
    
    pid=$! # Process ID of the previous running command
    spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    i=0
    
    while kill -0 $pid 2>/dev/null
    do
      i=$(( (i+1) %10 ))
      printf "\r${spin:$i:1} Pushing to GitHub..."
      sleep .1
    done
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