#!/bin/bash

ROOTFS_DIR=$(pwd)
BASHRC_FILE="${ROOTFS_DIR}/root/.bashrc"

cat > "${BASHRC_FILE}" << 'EOF'
# Custom bash configuration for admin@client

# Màu đỏ cho prompt admin@client
RED='\[\e[0;31m\]'
RESET='\[\e[0m\]'
export PS1="${RED}admin@client${RESET}:~# "

# Chặn Ctrl+D
set -o ignoreeof
export IGNOREEOF=999

# Password để thoát shell
ADMIN_PASSWORD="admin@av4x04"

# Function exit với password protection
function exit() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Nhập password để thoát khỏi shell:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    read -s -p "Password: " input_password
    echo ""
    
    if [ "$input_password" = "$ADMIN_PASSWORD" ]; then
        echo "✓ Password chính xác. Đang thoát..."
        builtin exit
    else
        echo "✗ Password sai! Không thể thoát."
        echo ""
        return 1
    fi
}

# Function logout với password protection
function logout() {
    exit
}

# Export functions
export -f exit
export -f logout

# Message chào mừng
clear
echo ""
echo "╔════════════════════════════════════════════════════╗"
echo "║                                                    ║"
echo "║     Chào mừng đến với Admin Client Terminal       ║"
echo "║          Shell này đã được bảo vệ                 ║"
echo "║                                                    ║"
echo "╚════════════════════════════════════════════════════╝"
echo ""

EOF

chmod +x "${BASHRC_FILE}" 2>/dev/null
