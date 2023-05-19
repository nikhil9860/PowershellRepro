﻿Get-Mailbox -ResultSize Unlimited | Where {$_.WhenCreatedUTC -gt ((Get-Date).Adddays(-365))} | Get-MailboxStatistics | Where-Object {[int64]($PSItem.TotalItemSize.Value -replace '.+\(|bytes\)') -gt "10MB"} | Sort-Object TotalItemSize -Descending | Select-Object DisplayName, ItemCount, TotalItemSize