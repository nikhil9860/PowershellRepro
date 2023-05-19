Get-ADUser -Filter * -SearchBase “DC=nikhil9860,DC=local” -Properties objectGUID | Select-Object UserPrincipalName, objectGUID, @{Name = ‘ImmutableID’; Expression = { [system.convert]::ToBase64String(([GUID]$_.objectGUID).ToByteArray()) } } | Export-CSV users.csv





