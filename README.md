
# Secure Vault System - Junior Cybersecurity Project

A Linux-based secure vault system that can safely store secrets, control file access, allow secure updates, and monitor security risks.

## Project Overview

This project consists of 4 bash scripts that work together to create and manage a secure vault system:

1. **vault_setup.sh** - Initial vault setup
2. **vault_permissions.sh** - Permission management
3. **vault_ops.sh** - Vault operations (menu-driven)
4. **vault_monitor.sh** - Security monitoring and reporting

## Installation

1. Clone this repository:
```bash
git clone <your-repo-url>
cd secure-vault-system
```

2. Make all scripts executable:
```bash
chmod +x vault_setup.sh vault_permissions.sh vault_ops.sh vault_monitor.sh
```

## Usage

### Step 1: Vault Setup
Run the setup script to create the vault structure:
```bash
./vault_setup.sh
```

This will:
- Create a `secure_vault` directory in your home folder
- Create three files: `keys.txt`, `secrets.txt`, and `logs.txt`
- Add welcome messages to each file
- Display the created files

### Step 2: Configure Permissions
Set appropriate permissions for vault files:
```bash
./vault_permissions.sh
```

This will:
- Check if the vault exists
- For each file, display current permissions
- Prompt you to update permissions (or use defaults)
- Default permissions:
  - `keys.txt`: 600 (owner read/write only)
  - `secrets.txt`: 640 (owner read/write, group read)
  - `logs.txt`: 644 (owner read/write, group/others read)

### Step 3: Vault Operations
Manage vault contents with the menu-driven interface:
```bash
./vault_ops.sh
```

Menu options:
1. **Add Secret** - Append a new secret to secrets.txt
2. **Update Secret** - Replace existing secret using pattern matching
3. **Add Log Entry** - Add timestamped log entry
4. **Access Keys** - Attempt to access keys (always denied for security)
5. **Exit** - Exit the program

### Step 4: Monitor Security
Check vault security status:
```bash
./vault_monitor.sh
```

This will:
- Display detailed information for each vault file
- Flag any security risks (permissions > 644)
- Save results to `vault_report.txt`

## File Structure

```
~/secure_vault/
├── keys.txt          # Encryption keys storage
├── secrets.txt       # Confidential data storage
├── logs.txt          # System logs
└── vault_report.txt  # Security monitoring report (generated)
```

## Security Features

- **Access Control**: Files have restrictive permissions
- **Audit Trail**: All operations are logged with timestamps
- **Key Protection**: Encryption keys are always access-denied
- **Risk Detection**: Automatic monitoring for overly permissive permissions
- **Reporting**: Generates security reports for compliance

## Project Requirements Met

- Vault directory creation and file initialization  
- I/O redirection for file operations  
- Interactive permission management with defaults  
- Function-based permission updates  
- Menu-driven operations using `while` loop and `case`  
- Pattern-based updates using `sed`  
- Timestamped logging using `date`  
- Security monitoring and risk detection  
-Report generation with file statistics  

## Author

Junior Cybersecurity Team Member

## License

Educational project for cybersecurity training.
