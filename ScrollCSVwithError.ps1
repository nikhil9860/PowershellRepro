$users =  Import-Csv -Path C:\Temp\CSVList.csv



 foreach($user in $users) { 

    try{


Get-Mailbox -Identity $user.Emailaddress -ErrorAction Stop

 
 }Catch{
 
 
$user.Emailaddress |Out-File "c:\Temp\NamesofEmailaddresswithErrors.txt" -Append 

$_| Out-File "c:\Temp\ScriptErrors.txt" -Append
 
 
 }
  

} 