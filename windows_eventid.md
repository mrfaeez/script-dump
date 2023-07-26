# Windows Event ID for Threat Hunting

## How To Use
Splunk: index=windows_uf EventCode IN (code1, code2, ...)

## Event Code ID
### Successful Logon/Authentication
1. 4624 - Successful Login
2. 4627 - Special privileges assigned to new logon

### Fail logon
1. 4625 - Unsuccessful Login
2. 4740 - An account was locked out
3. 4771 - Kerberos authentication fail
4. 4797 - Attempt made to query the existence of a blank password

### Check user behavior
1. 4723 - An attempt was made to change an account's password
2. 4724 - Attempt to change other people's password
3. 4798 - A user's local group membership was enumerated.

### Check Admin Behavior
1. 4767 - A user account was unlocked
2. 4738 - A user account attribute is changed
