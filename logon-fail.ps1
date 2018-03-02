
#.'C:\Users\Public\crypto.ps1'

$message=Get-EventLog -LogName Security -Computer ANONMOUSE-2 -InstanceID 4625 | select message | format-list | findstr /c:"Account Name" | Sort-Object | Get-Unique

#Write-Output $message #full message with accountname: username format

$tmp=$message | %{ $_.Split(':')[1]; }

if($message -ne $null) {
	$SendAddress="bright7hat@gmail.com"
	$SMTPServer="smtp.gmail.com"
	$SMTPPort="587"

	#not currently using this section#
	$enc=Get-Content 'C:\Users\Public\pass.txt'
	$PT=Get-EncryptedData -data $enc -key $key
	###################################
	
	#stored pass in env variable for this test. Do NOT do this
	$password=ConvertTo-SecureString $env:pass -AsPlainText -Force

	$creds= New-Object System.Management.Automation.PSCredential ($SendAddress,$password) 
	$user=gwmi -class Win32_ComputerSystem | select username | grep ANON | %{ $_.Split('\')[1]; }

	Send-MailMessage -From $SendAddress -to "6186767971@vtext.com" -Subject "Logon Failure" `
	-Body " $tmp" `
	-SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $creds 

	#$temp=New-Object Byte[] 7
	#[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($temp)
	#$key = Set-Key $temp
	
	Clear-EventLog -LogName Security
}

$message=""


