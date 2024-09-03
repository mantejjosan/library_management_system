# library_management_system/api/webhook_handler.py

import json
import frappe
from frappe import _

@frappe.whitelist(allow_guest=True)  # Allows anonymous access
def webhook_handler():
    data = frappe.local.request.get_json()
    # Process the incoming data
    frappe.log_error(message=json.dumps(data), title="Webhook Received")
    
    # Example: Handle the data
    if 'event' in data:
        event_type = data['event']
        # Add custom processing logic here

    return {
        "status": "success",
        "message": _("Webhook processed successfully")
    }
