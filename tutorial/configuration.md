# Steps to Setup Frappe for Development

To build the Library Management System (LMS) with Frappe, you first need to set up a development environment. Follow the steps below to install the required software and tools.

### Step 1: Update System Packages

Start by updating your package list and upgrading all installed packages to their latest versions:

```bash
sudo apt-get update && sudo apt-get upgrade -y
```

### Step 2: Install Python and Pip
Frappe requires Python 3.8 or later. Install Python and its package manager, pip:
```bash
sudo apt install python3-dev python3-setuptools python3-pip
```

### Step 3: Install Node.js
Node.js is needed for building and running JavaScript components of Frappe. Install Node.js (version 14.x):
```bash
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs
```

### Step 4: Install Redis
Redis is used for caching and real-time updates in Frappe. Install it using:
```bash
sudo apt install redis-server
```

### Step 5: Install MariaDB
MariaDB serves as the database server for Frappe. Install it and configure it:
```bash
sudo apt install mariadb-server
sudo mysql_secure_installation
```
Follow the on-screen instructions to set up the MariaDB root password and remove insecure defaults.

### Step 6: Install Nginx
Nginx can be used to serve your Frappe application. Install it with:
```bash
sudo apt install nginx
```

### Step 7: Install Bench (Frappe CLI)
Bench is a command-line tool to manage Frappe applications. Install it globally using pip:
```bash
sudo pip3 install frappe-bench
```

### Step 8: Initialize Bench
Create a new Frappe bench folder to set up the development environment:
```bash
bench init frappe-bench --frappe-branch version-14
cd frappe-bench
```

### Step 9: Create a New Frappe Site
Create a new Frappe site named lms.local:
```bash
bench new-site lms.local
```

This will create the site and set up the necessary database tables.

### Step 10: Start Frappe
Start the Frappe development server:
```bash
bench start
```

### Step 11: Configure Hosts File (Optional)
To make the site accessible via lms.local, edit your hosts file:
```bash
sudo nano /etc/hosts
```
Add the following line:
```bash
127.0.0.1 lms.local
```

Now you can access your Frappe site by visiting http://lms.local:8000 in your web browser.

## Summary

You have now set up the Frappe development environment and created a new site for your Library Management System (LMS) project. With Frappe and all dependencies installed, you’re ready to start developing features like user roles, dashboards, forms, and more for your LMS.

Move on to the next section to learn about configuring your project and building specific features.
