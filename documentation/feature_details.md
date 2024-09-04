# Detailed User Guide for LMS Features

## Dashboard Overview

### Accessing the Dashboard
1. **Log In:**
   - Open your preferred web browser and go to the LMS URL.
   - Enter your credentials to access your account.

2. **Navigate to the LMS Dashboard:**
   - After logging in, click on the `LMS` module from the main menu or Frappe desk.

### Dashboard Widgets
- **Overview:** Quickly view key metrics like the total number of books, active loans, and overdue items.
- **Recent Activities:** Keep track of the most recent updates and actions within the system.

## Book Management

### Adding New Books
1. **Navigate to Books Module:**
   - Go to `LMS > Books`.

2. **Create a New Book Record:**
   - Click `New` to open a fresh book form.
   - Fill in all necessary details: Title, Author, ISBN, Publisher, and Availability status.
   - Click `Save` to add the new book to your library.

### Editing Book Information
1. **Find and Edit a Book:**
   - Search for the desired book using its title or ISBN in `LMS > Books`.
   - Click on the book record to open it.
   - Click `Edit`, update the necessary details, and save your changes.

### Deleting a Book
1. **Delete a Book Record:**
   - Locate the book you want to remove in `LMS > Books`.
   - Open the record, click `Delete`, and confirm the deletion.

## User Management

### Adding New Users
1. **Navigate to Users Module:**
   - Go to `LMS > Users`.

2. **Create a New User:**
   - Click `New` to start creating a new user profile.
   - Enter the user details, such as Email, Name, and Role.
   - Click `Save` to add the user to your system.

### Editing User Information
1. **Find and Edit a User:**
   - Search for the user by name or email in `LMS > Users`.
   - Open the user record, click `Edit`, update the information, and save.

### Deleting a User
1. **Delete a User:**
   - Locate the user in `LMS > Users`.
   - Open the record, click `Delete`, and confirm the action.

## Loan Management

### Recording a New Loan
1. **Go to Loans Module:**
   - Navigate to `LMS > Loans`.

2. **Create a Loan Record:**
   - Click `New` to start a new loan record.
   - Select the book, the borrower, and enter the Loan Date and Due Date.
   - Click `Save` to record the loan.

### Returning a Book
1. **Update Loan Status:**
   - Find the loan record in `LMS > Loans`.
   - Open the record, change the status to `Returned`, enter the Return Date, and save.

### Tracking Overdue Loans
1. **Generate Overdue Loans Report:**
   - Go to `LMS > Reports > Overdue Loans`.
   - Review the list of overdue items to manage follow-ups.

## Reports and Analytics

### Generating Reports
1. **Run Reports:**
   - Navigate to `LMS > Reports`.
   - Select the type of report you need (e.g., Books Inventory, Loan History).
   - Apply any necessary filters and click `Run Report`.

### Exporting Data
1. **Export Report Data:**
   - After running a report, click `Export` to download the data in your preferred format, such as CSV or Excel.

## Customizing LMS Features

### Adding Custom Fields
1. **Create Custom Fields:**
   - Go to `LMS > Customization > Custom Fields`.
   - Click `New`, enter details (Field Name, Type, Label), and click `Save` to create a custom field.

### Modifying Forms
1. **Edit Forms via Hooks:**
   - Update the `hooks.py` file in your app’s directory with custom functions to modify forms according to your needs.

---

### Navigation

[![Previous: Usage Instructions](https://img.shields.io/badge/Previous-Usage%20Instructions-blue?style=for-the-badge)](usage-instructions.md)  
[![Next: Troubleshooting](https://img.shields.io/badge/Next-Troubleshooting-blue?style=for-the-badge)](troubleshooting.md)
