$users = Get-ADUser -Filter * -SearchBase "OU=PNQ,DC=nikhil9860,DC=local"


foreach ($mailbox in $users){
   
   Set-ADUser -Identity $mailbox.SamAccountName -add @{"extensionattribute14"=((Get-ADUser -Identity $mailbox -Properties *).employeeType)}


   #(Get-ADUser -Identity $mailbox -Properties *).employeeType


}