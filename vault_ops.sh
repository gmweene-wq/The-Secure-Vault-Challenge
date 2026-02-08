#!/bin/bash

SECRETS_FILE=~/secure_vault/secrets.txt
LOGS_FILE=~/secure_vault/logs.txt
KEYS_FILE=~/secure_vault/keys.txt

# Menu-driven program that runs in a loop
while true; do
    echo ""
    echo "=== Secure Vault Operations ==="
    echo "1. Add Secret"
    echo "2. Update Secret"
    echo "3. Add Log Entry"
    echo "4. Access Keys"
    echo "5. Exit"
    echo ""
    read -p "Select an option (1-5): " choice
    
    case $choice in
        1)
            # Add Secret - Append a new secret
            read -p "Enter the secret to add: " secret
            echo "$secret" >> "$SECRETS_FILE"
            echo "✓ Secret added successfully"
            ;;
        2)
            # Update Secret - Replace an existing secret using sed
            read -p "Enter the text to find: " old_text
            read -p "Enter the replacement text: " new_text
            
            if grep -q "$old_text" "$SECRETS_FILE"; then
                sed -i "s/$old_text/$new_text/" "$SECRETS_FILE"
                echo "✓ Secret updated successfully"
            else
                echo "No match found."
            fi
            ;;
        3)
            # Add Log Entry - Add timestamped log
            timestamp=$(date "+%Y-%m-%d %H:%M:%S")
            read -p "Enter log message: " log_msg
            echo "[$timestamp] $log_msg" >> "$LOGS_FILE"
            echo "✓ Log entry added"
            ;;
        4)
            # Access Keys - Always deny access
            echo "ACCESS DENIED 🚫"
            ;;
        5)
            # Exit
            echo "Exiting Vault Operations..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please select 1-5."
            ;;
    esac
done

