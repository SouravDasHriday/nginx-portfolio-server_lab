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
npm run build  # Build the project for production

# Install and Configure Nginx
sudo apt install nginx -y

# Copy build files to Nginx web root
sudo cp -r build/* /var/www/html/

# Set Up Nginx Configuration
sudo tee /etc/nginx/sites-enabled/default > /dev/null <<EOF
server {
    listen 80;
    server_name souravdas.xyz www.souravdas.xyz;

    root /var/www/html;
    index index.html;

    location / {
        try_files \$uri /index.html;
    }
}
EOF

# Restart Nginx with new configuration
sudo nginx -t
sudo systemctl restart nginx

# Set Up Domain and SSL
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

# Enable auto-renewal for SSL
echo "0 3 * * * root certbot renew --quiet" | sudo tee -a /etc/crontab > /dev/null

echo "Nginx portfolio web server setup completed successfully!"

