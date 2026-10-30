#!/bin/bash
# Creates groups, users, project directories and permissions (Phases 2 - Steps 3-5, 7).
# Run as root: sudo bash setup_users_permissions.sh
set -e

groupadd -f developers
groupadd -f managers

id alice   &>/dev/null || useradd -m -g developers -s /bin/bash alice
id bob     &>/dev/null || useradd -m -g developers -s /bin/bash bob
id charlie &>/dev/null || useradd -m -g managers   -s /bin/bash charlie

# Generate random passwords (never hard-code passwords in a public repo)
for u in alice bob charlie; do
  pw=$(openssl rand -base64 12)
  echo "$u:$pw" | chpasswd
  echo "Password for $u: $pw   (save it, shown only once)"
done

mkdir -p /project/{dev,manager,shared}
chown -R root:developers /project/dev
chown -R root:managers   /project/manager
chown -R root:root       /project/shared
chmod 770 /project/dev /project/manager
chmod 777 /project/shared

# ACL: give charlie read-only access to /project/dev
setfacl -m u:charlie:r-x /project/dev

ls -la /project/
