
---

# `lab-notes/lab-walkthrough.md`

```markdown
# User Lifecycle Automation Lab Walkthrough

## Lab Purpose

This lab demonstrates how to automate the **Joiner–Mover–Leaver (JML)** lifecycle in **Microsoft Entra ID** using **PowerShell** and **Microsoft Graph**.

The lab simulates common IAM engineering tasks:

- Provisioning a new user
- Creating a security group
- Assigning group-based access
- Updating user attributes
- Disabling the account
- Removing access during offboarding

---

## Prerequisites

Before starting, ensure the following are installed and configured:

- PowerShell 7
- Microsoft Graph PowerShell SDK
- Access to a Microsoft Entra ID tenant
- Sufficient permissions to manage users and groups

---

## Step 1 — Verify PowerShell Version

Run:

```powershell
$PSVersionTable

*Confirm PowerShell 7 is installed.


Step 2 — Install Microsoft Graph Module
Run:
Install-Module Microsoft.Graph -Scope CurrentUser


Step 3 — Import the Module
Import-Module Microsoft.Graph


Step 4 — Connect to Microsoft Graph
Run:
Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All"

Step 5 — Verify Graph Connection
Run:
Get-MgContext

Step 6 — Create Password Profile
Run:
$PasswordProfile = @{
Password = "TempPassword123!"
ForceChangePasswordNextSignIn = $true
}

Step 7 — Create the User (Joiner)
Replace YOURTENANT with your actual Entra tenant domain.
Run:
New-MgUser -DisplayName "IAM Lab User" -MailNickname "iamlabuser" -UserPrincipalName "iamlabuser@YOURTENANT.onmicrosoft.com" -PasswordProfile $PasswordProfile -AccountEnabled:$true


