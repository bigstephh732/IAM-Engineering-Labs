# User Lifecycle Automation Lab

## Overview

This lab demonstrates **Identity and Access Management (IAM) user lifecycle automation** in **Microsoft Entra ID** using **PowerShell** and **Microsoft Graph**.

The lab simulates the **Joiner–Mover–Leaver (JML)** lifecycle commonly used in enterprise IAM environments:

- **Joiner** → create a new user account
- **Mover** → assign access through group membership and update user attributes
- **Leaver** → disable the account and remove group access

This project demonstrates how IAM engineers automate identity tasks to improve consistency, reduce manual effort, and enforce secure access controls.

---

## Objectives

The goal of this lab is to demonstrate practical IAM automation skills including:

- User provisioning in Microsoft Entra ID
- Security group creation
- RBAC-based access assignment
- User attribute updates
- Account disablement for offboarding
- Access removal during the leaver process
- PowerShell automation using Microsoft Graph

---

## Technologies Used

- Microsoft Entra ID
- Microsoft Graph PowerShell SDK
- PowerShell 7
- Role-Based Access Control (RBAC)

---

## Lab Workflow

This lab follows the **Joiner–Mover–Leaver** model:

### Joiner
- Create a password profile
- Create a new Entra ID user

### Mover
- Create a security group
- Add the user to the group
- Update the user department attribute

### Leaver
- Disable the user account
- Remove the user from the security group

---

## Files in This Lab

```text
User-Lifecycle-Automation
│
├── README.md
├── lab-notes
│   └── lab-walkthrough.md
├── scripts
│   └── jml-automation.ps1
└── screenshots
