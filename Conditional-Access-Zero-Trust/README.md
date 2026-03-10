## Conditional Access Engineering – Layered Policy Design

### Goal
Design and implement layered Conditional Access policies that enforce Zero Trust principles, including:
MFA enforcement
Device compliance enforcement
Blocking legacy authentication
This project demonstrates real-world Conditional Access engineering and policy validation.


### Objectives
Enforce MFA for all users
Require compliant devices for administrative roles
Prevent legacy authentication bypass
Validate enforcement using sign-in logs and policy simulation


### Architecture Overview
Three policies were implemented:
  1. Require MFA for All Users
  2. Require Compliant Device for Admin Group
  3. Block Legacy Authentication

Access decisions are evaluated dynamically at sign-in based on:
User scope
Application scope
Client app type
Device posture

## Policy 1 – Require MFA for All Users
Configuration
Users → All users
Excluded → break-glass-admin
Cloud apps → All cloud apps
Grant → Require MFA
Policy state → Enabled
Security Impact
Enforces multi-factor authentication tenant-wide
Protects against credential compromise
Excludes emergency account for recovery

## Policy 2 – Require Compliant Device for Admin Group
Configuration
Users → IAM-Admins group
Cloud apps → All cloud apps
Grant → Require device to be marked as compliant
Policy state → Enabled
Security Impact
Restricts administrative access to managed devices
Reduces risk of compromised unmanaged endpoints
Enforces device posture validation

## Policy 3 – Block Legacy Authentication
Configuration
Users → All users
Excluded → break-glass-admin
Cloud apps → All cloud apps
Conditions → Client apps → Legacy authentication clients
Grant → Block access
Policy state → Enabled
What Is Considered Legacy Authentication
Exchange ActiveSync
POP / IMAP
SMTP
Other basic authentication protocols
These do not support modern MFA enforcement.

### Validation & Testing

### Test 1 – MFA Enforcement
Signed in as standard user:
MFA challenge prompted
Sign-in logs confirmed:
CA-Require-MFA-All-Users → Success
Grant control → Require MFA

### Test 2 – Device Compliance Enforcement
Signed in as admin group member.
Sign-in logs confirmed:
CA-Require-Compliant-Device-Admins evaluated
Grant control enforced

### Test 3 – Legacy Authentication Block (Simulation)
Used Conditional Access What If Tool.
Configuration:
User → lab-user1
Cloud App → Office 365
Client App → Exchange ActiveSync clients
Result:
CA-Block-Legacy-Auth → Blocked
This confirms legacy authentication attempts would be denied.


### Policy Evaluation Logic
Access is evaluated using:
IF user is in scope
AND client app matches condition
THEN apply grant control
Conditional Access decisions are enforced at sign-in.


### Security Impact
Eliminates basic authentication bypass
Enforces MFA across tenant
Protects administrative access via device posture
Aligns with Zero Trust security model


### IAM Concepts Demonstrated
Conditional Access policy scoping
Grant controls vs block controls
Client app conditions
Break-glass account exclusion
Policy simulation using What If tool
Sign-in log validation

### Summary
This project demonstrates practical Conditional Access engineering using Microsoft Entra ID. Policies were layered to enforce authentication strength, device posture validation, and legacy authentication blocking, with validation performed through sign-in logs and simulation tools.

