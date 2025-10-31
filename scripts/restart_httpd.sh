#!/bin/bash

# Install Apache if not installed
if ! rpm -q httpd; then
  sudo yum install -y httpd
fi

# Restart Apache
sudo systemctl restart httpd
