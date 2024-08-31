Here's a refined and comprehensive guide for configuring Frappe to manage your Library Management System (LMS), incorporating the correct field types and labels as you described:

---

# Configuring Frappe for Library Management System

## 1. Creating Doctypes

### 1.1 Create Doctype: Article

1. **Module:** Lib Man Sys
2. **Fields:**
   - **Article Name** (Data, Mandatory)
   - **Image** (Attach Image)
   - **Author** (Data)
   - **Description** (Text Editor)
   - **ISBN** (Data)
   - **Status** (Select: Issued, Available)
   - **Publisher** (Data)

Save the Doctype. Go to the Article list, add an article, and configure roles under the settings.

### 1.2 Create Doctype: Library Member

1. **Fields:**
   - **Full Name** (Data, Mandatory)
   - **Email Address** (Data)
   - **Phone** (Data)
2. **Naming:** Set to Autoincrement.

Save the Doctype. Add a library member.

### 1.3 Create Doctype: Library Membership

1. **Fields:**
   - **Library Member** (Link, Mandatory) - Set options to Library Member
   - **Full Name** (Data, Read Only) - Set fetch from Library Member
   - **From Date** (Date)
   - **To Date** (Date)
   - **Paid** (Check)

2. **Additional Settings:**
   - **Is Submittable**: Enabled
   - **Naming Series**: LMS.#####

Save the Doctype. Configure roles and permissions as needed.

### 1.4 Create Doctype: Library Transaction

1. **Fields:**
   - **Article** (Link to Article)
   - **Library Member** (Link to Library Member)
   - **Type** (Select: Issue, Return)
   - **Date of Transaction** (Date)

Save the Doctype.

### 1.5 Create Doctype: Library Settings

1. **Fields:**
   - **Loan Period** (Int)
   - **Maximum Number of Issued Articles** (Int)

Save the Doctype.

## 2. Writing Code to Check Active Membership

### 2.1 Implementing Logic in `library_membership.py`

Navigate to the `library_membership.py` file:

```bash
cd apps/lib_man_sys/lib_man_sys/doctype/library_membership
nano library_membership.py
```

Add the following code:

```python
import frappe
from frappe.model.document import Document
from frappe.model.docstatus import DocStatus

class LibraryMembership(Document):
    def before_submit(self):
        exists = frappe.db.exists(
            "Library Membership",
            {
                "library_member": self.library_member,
                "docstatus": DocStatus.submitted(),
                "to_date": (">", self.from_date),
            },
        )
        if exists:
            frappe.throw("There is an active membership for this member")
```

### 2.2 Validating Transactions in `library_transaction.py`

Navigate to the `library_transaction.py` file:

```bash
cd apps/lib_man_sys/lib_man_sys/doctype/library_transaction
nano library_transaction.py
```

Add the following code:

```python
import frappe
from frappe.model.document import Document
from frappe.model.docstatus import DocStatus

class LibraryTransaction(Document):
    def before_submit(self):
        if self.type == "Issue":
            self.validate_issue()
            self.validate_maximum_limit()
            article = frappe.get_doc("Article", self.article)
            article.status = "Issued"
            article.save()

        elif self.type == "Return":
            self.validate_return()
            article = frappe.get_doc("Article", self.article)
            article.status = "Available"
            article.save()

    def validate_issue(self):
        self.validate_membership()
        article = frappe.get_doc("Article", self.article)
        if article.status == "Issued":
            frappe.throw("Article is already issued by another member")

    def validate_return(self):
        article = frappe.get_doc("Article", self.article)
        if article.status == "Available":
            frappe.throw("Article cannot be returned without being issued first")

    def validate_maximum_limit(self):
        max_articles = frappe.db.get_single_value("Library Settings", "max_articles")
        count = frappe.db.count(
            "Library Transaction",
            {"library_member": self.library_member, "type": "Issue", "docstatus": DocStatus.submitted()},
        )
        if count >= max_articles:
            frappe.throw("Maximum limit reached for issuing articles")

    def validate_membership(self):
        valid_membership = frappe.db.exists(
            "Library Membership",
            {
                "library_member": self.library_member,
                "docstatus": DocStatus.submitted(),
                "from_date": ("<", self.date),
                "to_date": (">", self.date),
            },
        )
        if not valid_membership:
            frappe.throw("The member does not have a valid membership")
```

## 3. Enabling Web View for Article Doctype

1. **Log in to your site:** `yoursite.com`.
2. **Navigate to the Doctype List:**
   - Open "Article".
3. **Configure Web View:**
   - Enable **Has Web View**.
   - Allow guest viewing.
   - Index web pages for search.
   - Set **Route** to `articles`.
   - Set **Is Published** field to `published`.
   - Add fields:
     - **Route** (Data)
     - **Published** (Select)
   - Save the changes.

## 4. Customizing the Webpage

### 4.1 Customize `article.html`

Navigate to the article template:

```bash
cd article/templates
nano article.html
```

Add the following code:

```html
{% extends "templates/web.html" %}

{% block page_content %}

<div class="py-20 row">
<div class="col-sm-2">
<img alt="{{ title }}" src="{{ image }}"/>
</div>
<div class="col">
<h1>{{ title }}</h1>
<p class="lead">By {{ author }}</p>
<div>
    {%- if status == 'Available' -%}
    <span class="badge badge-success">Available</span>
    {%- elif status == 'Issued' -%}
    <span class="badge badge-primary">Issued</span>
    {%- endif -%}
</div>
<div class="mt-4">
<div>Publisher: <strong>{{ publisher }}</strong></div>
<div>ISBN: <strong>{{ isbn }}</strong></div>
</div>
<p>{{ description }}</p>
</div>
</div>

{% endblock %}
```

### 4.2 Customize `article_row.html`

Edit `article_row.html`:

```bash
nano article_row.html
```

Add the following code:

```html
<div class="py-8 row">
<div class="col-sm-1">
<img alt="{{ doc.name }}" src="{{ doc.image }}"/>
</div>
<div class="col">
<a class="font-size-lg" href="{{ doc.route }}">{{ doc.name }}</a>
<p class="text-muted">By {{ doc.author }}</p>
</div>
</div>
```

---

This guide should help you effectively configure Frappe for managing your Library Management System. Feel free to make adjustments based on your specific requirements and preferences.
