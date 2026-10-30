#!/bin/bash
# Creates groups, users, project directories and permissions (Phases 2 - Steps 3-5, 7).
# Run as root: sudo bash setup_users_permissions.sh
set -e

groupadd  developers
groupadd  managers

id alice   &>/dev/null || useradd -m -g developers -s /bin/bash alice
id bob     &>/dev/null || useradd -m -g developers -s /bin/bash bob
id charlie &>/dev/null || useradd -m -g managers   -s /bin/bash charlie

# Set passwords
echo "alice:Alice@123" | chpasswd
echo "bob:Bob@123" | chpasswd
echo "charlie:Charlie@123" | chpasswd

# Verify users created
cat /etc/passwd | grep -E "alice|bob|charlie"
cat /etc/group | grep -E "developers|managers"

# Check user IDs
id alice
id bob
id charlie

mkdir -p /project/{dev,manager,shared}
chown -R root:developers /project/dev
chown -R root:managers   /project/manager
chown -R root:root       /project/shared
chmod 770 /project/dev /project/manager
chmod 777 /project/shared

# ACL: give charlie read-only access to /project/dev
setfacl -m u:charlie:r-x /project/dev

ls -la /project/
