# PS Logon Detection

## logon.ps1
Detects successful logon attempts. Emails your desired email account upon successful logon attempt. You will also be sent
the username of the user that logged on successfully. This could be expanded to include logon type, such as local or network logon.

## logon-fail.ps1
Detects unsuccessful logon attempts. Emails your desired email account upon unsucessful attempts. This also handles failed attempts
by service accounts, so this could be used in troubleshooting faulty service account login. Again, this could be expanded to detect
desired logon type.

Gets the job done, but if used frequently there should be some security measures taken with password storage. There
are modules that should be used in powershell to properly secure password storage for use of this script. 