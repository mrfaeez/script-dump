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

