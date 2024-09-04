# Installation of the Library Management System (LMS)

In this section, you will find detailed instructions on how to install and configure the Library Management System (LMS) on your server. Follow these steps to get LMS up and running.

## Prerequisites

Before you begin the installation, ensure that your system meets the following requirements:

- **Operating System**: Linux (Ubuntu 18.04 or higher recommended)
- **Web Server**: Nginx or Apache
- **Database**: MySQL/MariaDB
- **Python**: Version 3.6 or higher
- **Node.js**: Version 12 or higher
- **Yarn**: Latest version
- **Frappe Framework**: Installed and configured

## Step 1: Update Your System

Ensure that your system is up to date by running the following commands:

```bash
sudo apt-get update
sudo apt-get upgrade
```

## Step 2: Install Dependencies

Install the necessary dependencies for LMS:

```bash
sudo apt-get install python3-pip python3-dev libmysqlclient-dev
sudo apt-get install nodejs npm
sudo npm install -g yarn
```

## Step 3: Install Frappe Bench

Frappe Bench is a command-line tool to install and manage Frappe sites. Install it using:

```bash
sudo pip3 install frappe-bench
```

## Step 4: Initialize Frappe Bench

Create a new bench instance and set up your environment:

```bash
bench init lms-bench --frappe-branch version-13
cd lms-bench
```

## Step 5: Create a New Site

Create a new site for your LMS application:

```bash
bench new-site lms.local
```

During this step, you'll be prompted to set the MySQL root password and create a new administrator password for the site.

## Step 6: Install the LMS App

Now, clone the LMS app repository and install it on your site:

```bash
bench get-app lms https://github.com/yourusername/lms.git
bench --site lms.local install-app lms
```

Replace `https://github.com/yourusername/lms.git` with the actual URL of your LMS repository.

## Step 7: Start the Bench

Finally, start the Frappe Bench to launch your LMS site:

```bash
bench start
```

Your LMS should now be accessible at `http://lms.local`. You can log in using the administrator credentials you set earlier.

## Troubleshooting

If you encounter any issues during the installation, consult the [Troubleshooting](troubleshooting.md) section of this documentation.

---

## Next Steps

Once the installation is complete, proceed to the **Configuration** section to set up the database, initial settings, and more.

[![Next: Configuration](https://img.shields.io/badge/Next-Configuration-blue?style=for-the-badge)](configuration.md)
[![Previous: Introduction](https://img.shields.io/badge/Previous-Introduction-blue?style=for-the-badge)](introduction.md)
