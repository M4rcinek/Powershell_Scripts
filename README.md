# Powershell_Scripts
PowerShell scripts developed and used throughout my IT career.

---

## Table of Contents
1. [Check_Starting_GPO](#1-check-starting-gpo)
2. [Check_files_lt_4m](#2-check-files-<-4-months)
3. [Permissions_by_user](#3-permissions-by-user)
4. [Ping_Machine](#4-ping-machine)

---

## 1. Check Starting GPO

This script was developed to identify Group Policy Objects (GPOs) that deploy installers during the Windows logon process.
This information was useful when preparing computers for sale after they had been removed from the domain. It allowed us to manually remove leftover software deployment entries without reinstalling Windows.

## 2. Check Files < 4 months

This script allows the user to list all files created or modified within the last four months in a defined path.
It was used to investigate high disk space usage on a network share.

The script exports the results to a CSV file containing the file path and size. The data can then be easily imported into Excel for further analysis.

## 3. Permissions by user

This PowerShell script lists the paths that a specified user has access to.
It is particularly useful in environments where access permissions are assigned directly to individual users rather than through security groups.

## 4. Ping Machine

This script was developed before a dedicated monitoring system was implemented.
It provides an interface for pinging cameras and terminals defined in associated TXT files. This makes it easy to check which devices are currently reachable and which are not.

The script also provides an option to ping a single IP address manually.
