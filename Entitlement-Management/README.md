## Lifecycle Automation – Time-Bound Access (Entitlement Management)


### Goal
Implement automated lifecycle-based access control using Microsoft Entra Entitlement Management to grant time-bound access and automatically remove permissions upon expiration.


### Objective
-Automate access provisioning  
-Enforce time-limited access  
-Automatically remove access on expiration  
-Demonstrate governance-driven IAM model  


### Architecture Overview

Components Used:
-Security Group: IAM-Project-Access
-Catalog: IAM-Automation-Catalog
-Access Package: Time-Bound-Project-Access
-Assignment Policy: 7-Day Expiration

Access Flow:
1. User requests access
2. System grants access automatically
3. Expiration timestamp assigned
4. Access automatically removed after 7 days
5. No manual intervention required.


### Configuration Steps
### Step 1 – Created Security Group
Created:
IAM-Project-Access
Used as resource granted by access package.

### Step 2 – Created Catalog
Created:
IAM-Automation-Catalog
Added IAM-Project-Access as a resource.

### Step 3 – Created Access Package
Created:
Time-Bound-Project-Access
Added resource role:
IAM-Project-Access
Member

### Step 4 – Configured Assignment Policy
Configured:
-Users in directory may request
-No approval required
-Access duration = 7 days
-Expire access
-Remove access automatically

*This enforces lifecycle automation.


### Validation & Testing
Test 1 – Request Access
User:
lab-user1
Requested access via:
https://myaccess.microsoft.com
Access granted automatically.  

Test 2 – Verify Assignment  
Verified:
Assignment status = Delivered
Expiration date assigned
Confirmed user added to IAM-Project-Access group.  

Test 3 – Lifecycle Logic Confirmation
Reviewed assignment record:
Start date
Expiration date
Removal configured
This confirms lifecycle-based access control.


### Automation Behavior
The system automatically:  
-Provisions group membership  
-Sets expiration timestamp  
-Removes access after expiration  
-Maintains audit records  
-also No administrator cleanup required.  


### Security Impact
-Prevents access creep.  
-Reduces forgotten permissions.  
-Enforces least privilege.  
-Automates onboarding/offboarding.  
-Supports audit and compliance requirements.  


### IAM Concepts Demonstrated
-Entitlement Management  
-Access Packages  
-Assignment Policies  
-Time-bound access  
-Automatic removal  
-Governance-based access control  


### Summary
This project demonstrates automated lifecycle management of access using Microsoft Entra ID. Time-bound access policies were implemented to reduce risk associated with long-term permissions while maintaining operational efficiency.
