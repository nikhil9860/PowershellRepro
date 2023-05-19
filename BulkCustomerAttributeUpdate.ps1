Set-RemoteMailbox Chumlee -ExtensionCustomAttribute1 (Get-ADUser -Identity Chumlee -Properties *).Division




Get-ADUser -Identity chumlee -Properties *).Division


$Mailboxes = Get-RemoteMailbox -ResultSize unlimited
foreach ($mailbox in $mailboxes){
    Set-RemoteMailbox $mailbox.Name -ExtensionCustomAttribute1 (Get-ADUser -Identity $mailbox.Name -Properties *).Division
}



Set-ADUser –Identity Test -add @{"extensionattribute15"="MyString"}