#!/bin/bash

# Prompt the user to create a new ssh key
echo "Create new SSH key?"
read -p "Do you want to proceed (y/n)? " answer

# Check the user's response
if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    # Prompt the user for their email address
    echo "Enter your email address:"
    read EMAIL

    # Generate the ssh key
    ssh-keygen -t ed25519 -C "$EMAIL"
    ssh-add ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub
    echo "Add this key to github"
else
    echo "Aborting..."
fi