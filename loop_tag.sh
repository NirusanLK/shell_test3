#!/bin/bash

# Getting the tag message from user
read -p "Enter the tag message :" tag_message

# Loop for 3 iterations
for ((i=1; i<=3; i++)); do
    
    # Getting user input - Repo name, commit hash (full hash), tag name
    read -p "Enter $i remo repository name: " folder_name
    read -p "Enter commit hash to place the tag: " commit_hash

    # Change directory to the specified repo local folder
    cd "/home/nirusan-intern/Downloads/$folder_name" || { echo "Error: invalid repo name"; exit 1; }

    # Show the detailes based on commit hash that user entered before tagging to check is that valid tag
    git show $commit_hash

    # Disable git advice messages (For the commit hash encoding error message)
    git config advice.objectNameWarning false

    # Create a git tag with commit hash
    git tag -a "release1.1" $commit_hash -m "$tag_message"  || { echo "Error: unable to tag in the remot repo"; exit 1; }

    # Push the tag to the remote repository
    git push origin $tag_name || { echo "Error: Unable to push to the remote repo"; exit 1; }

    # Printing if the tag is added and pushed successfully
    echo "Tag $tag_name created and pushed successfully repo $folder_name."

    # Move back to the original directory for the next iteration
    cd -
done