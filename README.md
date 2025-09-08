# containerized-infrastructure

> A fully containerized web infrastructure using Docker — Nginx, WordPress, MySQL, and more.

A system administration project that sets up a complete web stack using **Docker containers** and **Docker Compose**. This project demonstrates deep understanding of **containerization**, **networking**, **security**, and **service orchestration**.

Built on a virtual machine, it includes an Nginx reverse proxy, a WordPress site with MySQL backend, Adminer for database management, Redis caching, an FTP server, and a static HTML/CSS resume site — all running in isolated, persistent containers.

---

### 🛠️ Features

#### ✅ **Core Infrastructure**
- **Virtual Machine**: Deployed on a Linux VM (e.g., Debian) with Docker and Docker Compose
- **Docker Network**: Custom bridge network for secure inter-container communication
- **Persistent Volumes**: Ensures data survives container restarts (for MySQL, WordPress, FTP)
- **Environment Variables**: Sensitive credentials (DB passwords, domain names) stored in `.env` file, **not committed to Git**

#### ✅ **Nginx Reverse Proxy**
- Routes traffic to different services based on domain/subdomain
- Configured with separate virtual host files for each service
- Serves as the single entry point for all web applications

#### ✅ **WordPress Blog**
- WordPress container connected to MySQL
- Persistent storage for themes, plugins, and uploads
- Reverse-proxied through Nginx

#### ✅ **MySQL Database**
- Dedicated MySQL container for WordPress
- Secured with non-root user and strong password
- Data stored in a named volume for persistence

#### ✅ **Adminer (Database Manager)**
- Lightweight web-based database management tool
- Allows inspection and management of MySQL databases

#### ✅ **Redis Cache**
- Redis container integrated with WordPress for object caching
- Improves performance and reduces database load
- Configured via `wp-config.php` and Redis plugin

#### ✅ **FTP Server**
- Pure-FTPd container for file management
- Points to the WordPress volume for easy theme/plugin updates
- Secured with user authentication

#### ✅ **Static Resume Website**
- A simple, responsive static website built with **HTML, CSS, and JavaScript**
- Demonstrates separation of services and clean design

---

### 🧰 Tech Stack
- **Containerization**: Docker, Docker Compose
- **Web Server**: Nginx
- **CMS**: WordPress
- **Database**: MySQL
- **Tools**: Redis (caching), Adminer (DB GUI), Pure-FTPd (file transfer)
- **Frontend**: HTML5, CSS3, JavaScript
- **OS**: Linux (Debian/Ubuntu VM)
- **Security**: `.env` files, isolated networks, volume persistence
