# Configuring Frappe Project

This guide will walk you through configuring your Frappe project after installation, specifically focusing on setting up the domain, basic configurations, and creating necessary Doctypes for your Library Management System (LMS).

## 1. Setting Up Domain and Basic Configurations

### 1.1. Create and Start Your Site

To begin, you'll need to create and start your new Frappe site.

```bash
bench new-site yoursite.com
bench start
```

Replace `yoursite.com` with your desired site name.

### 1.2. Edit the Hosts File

You'll need to update the hosts file to map your site to the localhost.

```bash
sudo nano /etc/hosts
```

Add the following lines to the hosts file:

```plaintext
127.0.0.1    localhost
127.0.0.1    yoursite.com
```

Exit and save the hosts file, then return to your regular user:

```bash
exit
```

### 1.3. Enter the Frappe Shell

To interact with your site directly, enter the Frappe shell:

```bash
bench --site yoursite.com console
```

## 2. Creating and Installing the App

### 2.1. Create a New App

You can create a new Frappe app where the LMS functionality will reside.

```bash
bench new-app lib_man_sys
```

### 2.2. Install the App on Your Site

Once the app is created, install it on your Frappe site:

```bash
bench --site yoursite.com install-app lib_man_sys
```

### 2.3. Accessing the App

To access the app, open your browser and go to `yoursite.com`.

- **Login:** `username = administrator`, `password = admin`.
- **Navigate:** After logging in, switch to Desk from the profile icon in the top right corner.

## 3. Configuring the Site

### 3.1. Configuring the Site's Settings

Once inside the Frappe shell, you'll want to configure your site's settings to match the needs of your LMS:

- **Administrator Login:** Use the default `username = administrator` and `password = admin` to log in to your site.
- **Switch to Desk:** After logging in, click on the profile icon at the top right and select "Switch to Desk" to access the backend workspace.

### 3.2. Setting Up User Permissions and Roles

To ensure smooth operation, configure user roles and permissions:

- **Roles:** Assign roles such as Administrator, Librarian, and Library Member.
- **Permissions:** Define what each role can access and modify. For example, a Librarian can add books and manage transactions, while a Library Member may only view available books.

### 3.3. Site Customization

Customize the site's appearance and functionality to align with your institution's branding and workflow:

- **Themes:** Apply themes and color schemes that suit your library's identity.
- **Modules:** Enable or disable specific modules based on your requirements. For LMS, enable modules like 'Library' and 'Memberships.'

### 3.4. Configuring Notifications and Alerts

Set up notifications for important events like book issues, returns, and membership renewals:

- **Email Alerts:** Configure email alerts to notify members of due dates or upcoming events.
- **SMS Integration:** If required, integrate SMS services to send notifications directly to members' mobile phones.

## 4. Advanced Configuration

### 4.1. Site Performance Optimization

To ensure the LMS runs efficiently, consider optimizing the site's performance:

- **Caching:** Enable caching mechanisms to reduce load times.
- **Database Optimization:** Regularly clean up and optimize the database to prevent sluggish performance.
- **Backup Strategy:** Set up automatic backups to safeguard data.

### 4.2. Security Settings

Enhance the security of your LMS by configuring:

- **SSL Certificates:** Install SSL certificates to ensure secure communication between the site and users.
- **Firewall Rules:** Set up firewall rules to restrict unauthorized access to the site.
- **User Authentication:** Implement two-factor authentication (2FA) for sensitive roles like Administrator.

---
[![Previous: Installation and Configuration](https://img.shields.io/badge/Previous-Installation%20and%20Configuration-blue?style=for-the-badge)](installation-configuration.md)
[![Next: Advanced Configuration](https://img.shields.io/badge/Next-Advanced%20Configuration-blue?style=for-the-badge)](advanced-configuration.md)
