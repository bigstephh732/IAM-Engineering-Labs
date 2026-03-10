
## Privileged Access Automation – Just-In-Time (JIT) Administrative Access

## Goal
Implement Just-In-Time (JIT) administrative access using Microsoft Entra Privileged Identity Management (PIM) to eliminate standing privileged roles and enforce time-bound elevation.


### Objective
Remove permanent administrative access
Enforce MFA during privilege activation
Require business justification
Limit elevation duration
Generate audit logs for compliance
This project demonstrates enterprise-grade privilege control aligned with Zero Trust principles.

### Architecture Overview
Identity Platform: Microsoft Entra ID
Feature Used: Privileged Identity Management (PIM)
Role Configured: User Administrator
Access Model: Eligible → Activated (Time-Bound)
Access Flow:
User assigned Eligible role
User activates role when needed
MFA + justification required
Role active temporarily
Role expires automatically
Audit logs record activation


### Configuration Steps

### Step 1 – Assign Eligible Role
Navigated to: Identity Governance → PIM → Roles
Selected: User Administrator
Assigned role to: lab-admin
Assignment type: Eligible
Duration: Permanent
At this stage, no administrative permissions were granted.

### Step 2 – Configure Role Settings
Configured the following activation controls:
Require MFA on activation → Enabled
Require justification → Enabled
Maximum activation duration → 1 hour
Approval requirement → Disabled (lab simplicity)
This ensures controlled elevation.

### Step 3 – Activate Role
Signed in as lab-admin
Navigated to: PIM → My Roles
Selected: User Administrator
Clicked Activate
Provided justification:
“Temporary elevation required to manage user accounts and perform directory administration.”
Completed MFA challenge
Activated role for 1 hour

### Step 4 – Validate Activation
Confirmed role appears under:
PIM → My Roles → Active
Expiration timestamp visible.

### Step 5 – Review Audit Logs
Reviewed:
PIM → Audit History
Verified:
Activation event
User identity
Timestamp
Justification
MFA enforcement
Audit logging confirms accountability and traceability.


### Automation Behavior
This configuration ensures:
No permanent privileged access
Privileges only exist during activation window
Automatic expiration removes elevated rights
All activation events are logged
No manual cleanup required.


### Security Impact
Eliminates standing administrative access
Reduces attack surface
Prevents privilege abuse
Enforces multi-factor authentication at elevation
Creates compliance-ready audit trails
This aligns with Zero Trust and least privilege principles.


### Key IAM Concepts Demonstrated
Eligible vs Active role assignments
Just-In-Time privilege elevation
MFA enforcement at privilege boundary
Time-bound access control
Audit logging and accountability
Least Privilege


### Summary
This project demonstrates practical implementation of privileged access automation using Microsoft Entra ID. By replacing permanent administrative access with controlled, time-bound elevation, the risk of privilege abuse is significantly reduced while maintaining operational flexibility.
