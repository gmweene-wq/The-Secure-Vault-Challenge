#!/bin/bash


mkdir -p ~/secure_vault


echo "Welcome to the encryption keys storage" > ~/secure_vault/keys.txt
echo "Welcome to the confidential data storage" > ~/secure_vault/secrets.txt
echo "Welcome to the system logs storage" > ~/secure_vault/logs.txt

echo " Vault setup complete!"
echo ""

ls -l ~/secure_vault
