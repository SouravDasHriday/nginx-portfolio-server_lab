#!/bin/bash

# Update system packages
sudo apt update -y && sudo apt upgrade -y

# Install Node.js and NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
nvm install 20

# Clone Portfolio Website Repository
git clone https://github.com/jaiswaladi246/Portfolio-Website.git
cd Portfolio-Website
npm install
npm run build

# Install and Configure Nginx
sudo apt install nginx -y
sudo cp nginx-config.conf /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx

# Set Up Domain and SSL
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d souravdas.xyz -d www.souravdas.xyz

# Enable auto-renewal for SSL
echo "0 3 * * * root certbot renew --quiet" | sudo tee -a /etc/crontab > /dev/null

echo "Nginx portfolio web server setup completed successfully!"
