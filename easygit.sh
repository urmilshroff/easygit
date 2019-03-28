#!/bin/bash

create_vars()
{
    RED="\033[0;31m"
    GREEN="\033[0;32m"
    YELLOW="\033[0;33m"
    NC="\033[0m"
    
    current_branch=$(git symbolic-ref -q HEAD)
    current_branch=${current_branch##refs/heads/}
}

debug()
{
    echo -e "Debug output starts"
    # echo -e "${RED}hello hi i am RED${NC}"
    # echo -e "And I am ${GREEN}GREEN${NC} and ${YELLOW}YELLOW${NC}!"
    echo -e "Debug output ends"
}

upload()
{
    git add .
    echo -e "What changes did you make since the last time you uploaded?"
    read commit_message
    git commit -m "${commit_message}"
    git push

    echo -e "${GREEN}Successfully uploaded all changes (if any!)${NC}"
}

download()
{
    git fetch
    git pull

    echo -e "${GREEN}Successfully downloaded all changes (if any!)${NC}"
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

create_branch()
{
    echo -e "Enter name of the new branch. It will be the same as '${current_branch}'"
    read new_branch
    git checkout -b ${new_branch}
    git push --set-upstream origin ${new_branch}
    current_branch = new_branch
    
    echo -e "${GREEN}Successfully created new branch '${current_branch}'!${NC}"
}

menu()
{
    create_vars
    
    echo -e "What would you like to do?"
    echo -e "1. Refresh everything"
    echo -e "2. Upload all changes"
    echo -e "3. Download new changes"
    echo -e "4. Create new branch same as '${current_branch}'"

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
            
        4)
        create_branch
        ;;

        *)
            debug
            ;;
    esac
}

menu