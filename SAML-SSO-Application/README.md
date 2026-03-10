### Application SSO with Conditional Access Enforcement

### Concept to Implementation  
Lab 11 focused on understanding SSO methods and configuration concepts. This extension (Lab 11.5) moves from theory to implementation by deploying SAML-based SSO with Conditional Access and MFA enforcement to reflect real-world enterprise identity security practices.

### Goal
Configure SAML-based Single Sign-On (SSO) for a non-gallery enterprise application and enforce secure access using Conditional Access with MFA.

This project demonstrates centralized authentication, group-based RBAC, and app-level security enforcement.  


### Objectives
-Configure SAML-based SSO  
-Assign application access using group-based RBAC  
-Enforce MFA at the application level  
-Validate authentication and policy enforcement using sign-in logs  


### Architecture Overview
Components Used:  
-Enterprise Application → IAM-SAML-Test-App  
-Authentication Protocol → SAML 2.0  
-Access Control → IAM-Project-Access (Security Group)  
-Conditional Access Policy → App-specific MFA enforcement  

Access Flow:  
-User signs in  
-User launches application via MyApps  
-Entra authenticates user  
-Conditional Access policy evaluated  
-MFA enforced  
-SAML assertion generated  
-Browser redirected to application ACS endpoint  


### Configuration Steps

### Step 1 – Created Enterprise Application
Navigated to:  
Entra ID → Enterprise Applications → New application  
Created:  
IAM-SAML-Test-App  
Selected:  
Integrate any other application you don't find in the gallery  

### Step 2 – Configured SAML SSO
Configured:  
Identifier (Entity ID):  
https://iam-saml-test-app  
Reply URL (ACS):  
https://iam-saml-test-app/acs  
Saved configuration.  

### Step 3 – Assigned Group-Based Access
Assigned security group:  
IAM-Project-Access  
Role:  
Default Access  
This ensures application access is tied to lifecycle-managed group membership.  

### Step 4 – Implemented Conditional Access Policy
Created policy:  
CA-Require-MFA-IAM-SAML-Test-App  
Assignments:  
Users → IAM-Project-Access group  
Cloud Apps → IAM-SAML-Test-App  
Grant Control:  
Require multi-factor authentication  
Policy state:  
Enabled  
This enforces MFA specifically for this application.  


### Validation & Testing

### Test 1 – Application Launch 
Signed in as:  
lab-user1  
Navigated to:  
https://myapps.microsoft.com  
Launched:  
IAM-SAML-Test-App  

Observed:  
-MFA challenge triggered  
-Redirect to configured SAML Reply URL  
-Browser attempted to reach ACS endpoint  

Even though the test application does not exist, the redirect confirms successful SAML assertion issuance.  

### Test 2 – Sign-In Log Verification  
Navigated to:  
Entra ID → Monitoring → Sign-in logs  

Confirmed:  
-Application = IAM-SAML-Test-App  
-Status = Success  
-Conditional Access → CA-Require-MFA-IAM-SAML-Test-App applied  
-Grant control → MFA required  

This validates authentication and policy enforcement. 


### Security Enforcement Logic
Access is evaluated as follows:

IF user is in IAM-Project-Access group
AND application = IAM-SAML-Test-App
THEN require MFA before SAML token issuance

*This demonstrates layered access control.


### Security Impact
-Centralized identity-based authentication  
-Reduced password sprawl  
-App-specific Conditional Access enforcement  
-Group-based RBAC tied to lifecycle management  
-Alignment with Zero Trust principles  


### IAM Concepts Demonstrated
-Enterprise Applications vs App Registrations  
-SAML-based federation  
-Service Provider (SP) trust configuration  
-Group-based RBAC  
-Conditional Access scoping  
-MFA enforcement at application boundary  
-Sign-in log validation  

### Summary
This project demonstrates enterprise SSO configuration combined with Conditional Access enforcement. Application access is centrally managed, group-controlled, and protected by MFA, aligning with modern identity security and Zero Trust principles.
