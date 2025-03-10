# 🌐 Nginx Portfolio Web Server on AWS 🚀

## **📌 Project Overview**
This project demonstrates how to set up a **Node.js portfolio website** on an **AWS EC2 Ubuntu instance**, configure **Nginx as a reverse proxy**, and secure the site with **SSL (Let's Encrypt)**. The domain is managed using **Hostinger DNS**.

### **🔧 Technologies Used**
- **Nginx** - Web Server & Reverse Proxy
- **Node.js** - Backend Application
- **AWS EC2** - Cloud Hosting
- **Hostinger** - Domain & DNS Management
- **Let's Encrypt** - Free SSL Certificates

---

## **📜 Setup Guide**

### **1️⃣ Launch AWS EC2 Instance**
1. Create an **Ubuntu 20.04/22.04** EC2 instance.
2. Configure **Security Groups** to allow:
   - **SSH (22)**
   - **HTTP (80)**
   - **HTTPS (443)**

---

### **2️⃣ Install Node.js & Clone Portfolio Repository**
Run the following commands in your EC2 instance:

```bash
sudo apt update
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
nvm install 20
git clone https://github.com/jaiswaladi246/Portfolio-Website.git
cd Portfolio-Website
npm install
npm start

3️. Set Up Nginx as a Reverse Proxy

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

4️. Configure Domain Name (Hostinger)

    Go to Hostinger DNS settings.
    Add A records pointing to your AWS public IP:
        @ → Your AWS Public IP
        www → Your AWS Public IP

Test with:

nslookup yourdomain.com


5️. Secure Website with SSL (HTTPS)

Install Certbot:

sudo apt install certbot python3-certbot-nginx -y

Generate an SSL certificate:

sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

Verify SSL:

sudo nginx -t
sudo systemctl restart nginx

Test in your browser:
✅ Visit https://yourdomain.com (should show a secure padlock )




---------------------------------------------------------------------
Future Improvements

    Enable automatic SSL renewal:

    sudo certbot renew --dry-run

    ⚡ Implement CI/CD for auto-deployment
    ⚡ Enable Nginx caching for better performance

Contribution & License

    Contributions are welcome! Create a pull request if you have improvements.
    Licensed under MIT License.

contact

For any queries, reach out:
Email:sdhriday77@gmail.com
