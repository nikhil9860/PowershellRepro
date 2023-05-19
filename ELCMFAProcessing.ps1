$Mbx = Get-Mailbox -Identity Test9@nikhil9860.com
$Report = @()
ForEach ($M in $Mbx) {
   $LastProcessed = $Null
   Write-Host "Processing" $M.DisplayName
   $Log = Export-MailboxDiagnosticLogs -Identity $M.Alias -ExtendedProperties
   $xml = [xml]($Log.MailboxLog)  
   $LastProcessed = ($xml.Properties.MailboxTable.Property | ? {$_.Name -like "*ELCLastSuccessTimestamp*"}).Value   
   $ItemsDeleted  = $xml.Properties.MailboxTable.Property | ? {$_.Name -like "*ElcLastRunDeletedFromRootItemCount*"}
   $MovedToArchive  = $xml.Properties.MailboxTable.Property | ? {$_.Name -like "*ElcLastRunArchivedFromRootItemCount*"}
   $ELCThrottled  = $xml.Properties.MailboxTable.Property | ? {$_.Name -like "*ELCFirstThrottleTimestamp*"}
   If ($LastProcessed -eq $Null) {
      $LastProcessed = "Not processed"}
   $ReportLine = [PSCustomObject]@{
           User          = $M.DisplayName
           LastProcessed = $LastProcessed
           ItemsDeleted  = $ItemsDeleted.Value
           MovedToArchive = $MovedToArchive.Value
           ELCThrottled = $ELCThrottled.Value
           
           
           }      
    $Report += $ReportLine
  }
$Report | Select User, LastProcessed, ItemsDeleted ,MovedToArchive,ELCThrottled