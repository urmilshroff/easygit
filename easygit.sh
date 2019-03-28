#!/bin/bash

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
NC="\033[0m"

debug()
{
    echo -e "\nDebug output starts"
    echo -e "${RED}hello hi i am RED${NC}"
    echo -e "And I am ${GREEN}GREEN${NC} and ${YELLOW}YELLOW${NC}!"
    echo -e "\nDebug output ends"
}

upload()
{
    git add .
    echo -e "\nWhat changes did you make since the last time you uploaded?"
    read commit_message
    git commit -m "$commit_message"
    git push

    echo -e "\n${GREEN}Successfully uploaded all changes (if any!)${NC}"
}

download()
{
    git fetch
    git pull

    echo -e "\n${GREEN}Successfully downloaded all changes (if any!)${NC}"
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

    *)
        debug
        ;;
esac