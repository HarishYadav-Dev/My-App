#!/bin/bash
# -------------------------------------------------------------------
# restart_httpd.sh
# This script restarts Apache (httpd) service after CodeDeploy copies
# new files to /var/www/html
# -------------------------------------------------------------------

# Exit immediately if a command fails
set -e

echo "Restarting Apache (httpd) service..."

# Try to restart httpd using systemctl first (Amazon Linux 2)
if command -v systemctl >/dev/null 2>&1; then
    systemctl restart httpd
    systemctl status httpd --no-pager
else
    # Fallback for older Amazon Linux versions using service command
    service httpd restart
fi

echo "Apache restarted successfully!"
