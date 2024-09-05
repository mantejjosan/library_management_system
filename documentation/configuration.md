# Configuration of the Library Management System (LMS)

In this section, you will learn how to configure the Library Management System (LMS) after installation. This includes setting up the database, initial settings, and configuring the environment to ensure the system runs smoothly.

## Step 1: Database Setup

Once the installation is complete, you need to configure the database that will store all the records related to books, users, transactions, etc.

1. Ensure that the MySQL or MariaDB server is running.
2. Use the following command to access the MySQL prompt:

   ```bash
   mysql -u root -p
   ```

3. Create a new database for LMS:

   ```sql
   CREATE DATABASE lms_db;
   ```

4. Grant the necessary privileges to the LMS user:

   ```sql
   GRANT ALL PRIVILEGES ON lms_db.* TO 'lms_user'@'localhost' IDENTIFIED BY 'password';
   FLUSH PRIVILEGES;
   EXIT;
   ```

5. Update the `site_config.json` file in your Frappe bench directory with the database details:

   ```json
   {
     "db_name": "lms_db",
     "db_password": "password"
   }
   ```

## Step 2: Initial Configuration

After setting up the database, follow these steps for the initial configuration:

1. Start the bench by running:

   ```bash
   bench start
   ```

2. Access the LMS web interface by navigating to `http://lms.local` in your browser.
3. Log in with the administrator credentials you created during installation.

4. Set up the following in the LMS dashboard:
   - **Library Settings**: Define the categories of books, membership levels, and lending policies.
   - **User Management**: Add librarians and define their roles and permissions.
   - **Member Records**: Import or manually add library members.

## Step 3: Email Configuration (Optional)

To enable email notifications (e.g., due dates, overdue reminders), you can configure an email service. Here's how:

1. Go to **Settings** > **Email Setup**.
2. Enter your email service provider’s SMTP settings.
3. Test the email configuration to ensure it works properly.

## Step 4: Backup Configuration (Optional)

Setting up automated backups ensures your data is safe. You can configure backups using Frappe's built-in backup feature:

1. Go to **Settings** > **Backup and Restore**.
2. Schedule regular backups and specify the location where backups will be stored (locally or in the cloud).

## Step 5: Customizing UI (Optional)

You can customize the user interface to better fit your organization’s needs:

1. Go to **Settings** > **Customize Forms**.
2. Modify the layout of the forms or add custom fields for books, users, or transactions.
3. Save your changes, and the new fields will be reflected across the system.

---

## Next Steps

Once the configuration is complete, proceed to the **Usage Instructions** section to learn how to use the key features of LMS.

[![Next: Usage Instructions](https://img.shields.io/badge/Next-Usage%20Instructions-blue?style=for-the-badge)](usage_instructions.md)
[![Previous: Installation](https://img.shields.io/badge/Previous-Installation-blue?style=for-the-badge)](installation.md)
