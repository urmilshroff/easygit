#!/bin/bash

echo -e "\nWhat would you like to do?\n1. Upload"
read choice

upload()
{
    git add .
    echo "What changes did you make since the last time you uploaded?"
    read commit_message
    git commit -m "$commit_message"
    git push
    echo "Successfully uploaded changed files!"
    echo "Hi"
}

case $choice in
    1)
        upload
        ;;
esac