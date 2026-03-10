## Access Reviews Automation – Governance Enforcement


### Goal
Implement automated access reviews for a security group to periodically validate user access and automatically remove access when denied or unreviewed.
This project demonstrates governance-driven lifecycle enforcement using Microsoft Entra Identity Governance.


### Objective
-Enforce periodic access certification  
-Automate removal of unnecessary access  
-Reduce access creep  
-Demonstrate compliance-ready governance model  


### Architecture Overview
Target Resource: IAM-Project-Access (Security Group)  
Review Configuration: Review Type → Teams + Groups  
Recurrence → Monthly  
Duration → 3 Days  
Reviewer → Self-review  
If no response → Remove access  
Apply results automatically → Enabled  

Governance Flow:  
-Review starts  
-Users evaluate access  
-Decisions collected  
-Review ends  
-Results applied automatically  
-Access updated accordingly  

 
 ### Configuration Steps

### Step 1 – Prepared Target Group
Used existing security group:
IAM-Project-Access  
*Ensured lab-user1 was a member prior to review.  

### Step 2 – Created Access Review
Navigated to: Entra ID → Identity Governance → Access Reviews → New access review  
Configured:
Review Name: IAM-Project-Access-Monthly-Review  
Review Type: Teams + Groups  
Selected group: IAM-Project-Access  

### Step 3 – Configured Review Settings
Configured: Recurrence → Monthly  
Duration → 3 days  
Reviewer → Self-review  
Upon completion → Apply results automatically  
If reviewer does not respond → Remove access  
*This ensures governance automation.  


### Validation & Testing

### Test 1 – User Review Experience
Signed in as: lab-user1  
Navigated to: https://myaccess.microsoft.com  
Accessed review and selected: Deny  

### Test 2 – Applied Results
As admin:
Stopped review  
Applied results  
Confirmed:
Review status → Completed  
Decision applied successfully  

### Test 3 – Verified Access Removal
Navigated to: Groups → IAM-Project-Access → Members  
Confirmed: lab-user1 removed from group  
*This validates automatic enforcement of review decision.  


### Automation Behavior
The system automatically:  
-Initiates periodic review  
-Collects user certification decisions  
-Applies results  
-Removes access when denied or unreviewed  

*No manual permission cleanup required.

### Security Impact
-Prevents stale permissions  
-Enforces least privilege  
-Reduces risk of unauthorized access persistence  
-Supports compliance and audit requirements  
-Automates periodic access validation  

### IAM Concepts Demonstrated
-Identity Governance  
-Access Reviews  
-Periodic Access Certification  
-Automated Access Removal  
-Governance Lifecycle Enforcement  

### Summary
This project demonstrates automated access governance using Microsoft Entra Identity Governance. By implementing recurring access certification and automatic removal of unnecessary access, long-term privilege accumulation risk is reduced while maintaining operational efficiency.

