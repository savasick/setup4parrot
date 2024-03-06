# Prompt the user to create a new gpg key
echo "Do you want to create a new gpg key?"
read -p "Press y/n: " answer

# Check the user's response
if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    # Generate the gpg key
    gpg --full-generate-key
    gpg --list-keys
    echo "Your new gpg key has been generated and listed."
else
    echo "Aborting..."
fi