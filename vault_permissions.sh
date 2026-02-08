#!/bin/bash

# Step 2: Vault Permissions
# Junior Cybersecurity Team - Secure Vault System

# Function to handle permission updates
update_permission() {
    local file=$1
    local default_perm=$2
    
    
    echo "File: $file"
    ls -l "$file"
    
    
    read -p "Do you want to update the permission? (yes/no): " response
    
    if [ "$response" = "yes" ]; then
        read -p "Enter new permission (e.g., 600): " new_perm
        
        
        if [ -z "$new_perm" ]; then
            chmod "$default_perm" "$file"
            echo "Applied default permission: $default_perm"
        else
            chmod "$new_perm" "$file"
            echo "Applied permission: $new_perm"
        fi
    else
        echo "Permission unchanged"
    fi
    echo ""
}


if [ ! -d ~/secure_vault ]; then
    echo "Error: secure_vault directory does not exist!"
    exit 1
fi


update_permission ~/secure_vault/keys.txt 600
update_permission ~/secure_vault/secrets.txt 640
update_permission ~/secure_vault/logs.txt 644


echo "=== Final Permissions ==="
ls -l ~/secure_vault
