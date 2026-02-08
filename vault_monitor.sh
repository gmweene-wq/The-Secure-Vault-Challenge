#!/bin/bash


VAULT_DIR=~/secure_vault
REPORT_FILE="$VAULT_DIR/vault_report.txt"

# Clear or create the report file
> "$REPORT_FILE"

# Function to output to both console and report file
output() {
    echo "$1" | tee -a "$REPORT_FILE"
}

output "=== Vault Security Monitoring ==="
output ""

# For each file in secure_vault, display information
for file in "$VAULT_DIR"/*; do
    # Skip the report file itself
    if [ -f "$file" ] && [ "$file" != "$REPORT_FILE" ]; then
        # Get file information
        filename=$(basename "$file")
        filesize=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        modified=$(stat -f"%Sm" -t "%Y-%m-%d %H:%M:%S" "$file" 2>/dev/null || stat -c"%y" "$file" 2>/dev/null | cut -d'.' -f1)
        permissions=$(ls -l "$file" | awk '{print $1}')
        
        # Display file information
        output "File: $filename"
        output "  Size: $filesize bytes"
        output "  Last modified: $modified"
        output "  Permissions: $permissions"
        
        # Get numeric permission value
        numeric_perm=$(stat -f%A "$file" 2>/dev/null || stat -c%a "$file" 2>/dev/null)
        
        # Check if permissions are more open than 644
        if [ "$numeric_perm" -gt 644 ]; then
            output "  ⚠️  SECURITY RISK DETECTED"
        fi
        
        output ""
    fi
done

output "=== Monitoring Complete ==="
echo ""
echo "✓ Report saved to: $REPORT_FILE"

