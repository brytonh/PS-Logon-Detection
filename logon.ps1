#####################################################
.'C:\Users\Public\crypto.ps1'

$SendAddress="YOUR GMAIL ACCOUNT HERE"
$SMTPServer="smtp.gmail.com"
$SMTPPort="587"

#not currently using this section#
#$enc=Get-Content 'C:\Users\Public\pass.txt'
#$PT=Get-EncryptedData -data $enc -key $key
###################################

#stored pass in env variable for this test. Do NOT do this
$password=ConvertTo-SecureString $env:pass -AsPlainText -Force

$creds= New-Object System.Management.Automation.PSCredential ($SendAddress,$password) 
$user=gwmi -class Win32_ComputerSystem | select username | grep $env:computername | %{ $_.Split('\')[1]; }

Send-MailMessage -From $SendAddress -to "email to send to" -Subject "User Logon" `
-Body "$user has just logged onto the computer." `
-SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $creds 

#Not currently using this section
#$temp=New-Object Byte[] 7
#[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($temp)
#$key = Set-Key $temp
##################################

#Write-Host -fore Cyan "`nSent Your E-mail"
#####################################################

