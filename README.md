🚀 Nginx Portfolio Web Server on AWS 🌐

📋 Project Overview

This project demonstrates how to deploy a Node.js portfolio website on an AWS EC2 Ubuntu instance, configure Nginx as a reverse proxy, and secure the site with SSL (Let's Encrypt). The domain is managed using Hostinger DNS.

🛠️ Technologies Used

    * Nginx - Web Server & Reverse Proxy

    * Node.js - Backend Application

    * AWS EC2 - Cloud Hosting

    * Hostinger - Domain & DNS Management

    * Let's Encrypt - Free SSL Certificates

🛠️ Setup Guide

1️⃣ Launch AWS EC2 Instance

    Create an Ubuntu EC2 instance.

    Configure Security Groups to allow:

        SSH (Port 22)
        HTTP (Port 80)
        HTTPS (Port 443)

2️⃣ Install Node.js & Clone Portfolio Repository

Run the following commands in your EC2 instance:

    sudo apt update
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm install 20
    git clone https://github.com/jaiswaladi246/Portfolio-Website.git
    cd Portfolio-Website
    npm install
    npm start


3️⃣ Set Up Nginx as a Reverse Proxy

    Install Nginx:
    
        sudo apt install nginx -y

    Configure Nginx:
    
        sudo nano /etc/nginx/sites-enabled/default

    Paste the following configuration:

    server {
        listen 80;
        server_name souravdas.xyz www.souravdas.xyz;

        root /var/www/html;
        index index.html;

        location / {
            try_files $uri /index.html;
        }
    }

    Save and restart Nginx:

        sudo nginx -t
        sudo systemctl restart nginx


4️⃣ Configure Domain Name (Hostinger)

    Go to Hostinger DNS settings.

    Add A records pointing to your AWS public IP:

        @ → Your AWS Public IP

        www → Your AWS Public IP

    Test the DNS configuration:

        nslookup souravdas.xyz

5️⃣ Secure Website with SSL (HTTPS)

    Install Certbot:

        sudo apt install certbot python3-certbot-nginx -y

    Generate an SSL certificate:

    s   udo certbot --nginx -d yourdomain.com -d www.yourdomain.com

    Verify SSL:

        sudo nginx -t
        sudo systemctl restart nginx

    Test in your browser----Visit: souravdas.xyz

🚀 Future Improvements

1️⃣ Enable automatic SSL renewal:

        sudo certbot renew --dry-run

📧 Contact

For any queries, reach out:

    Email: sdhriday77@gmail.com