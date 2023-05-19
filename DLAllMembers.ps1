 ## Set Variables:
    $group = "ITDL@nikhil9860.com"
    $members = New-Object System.Collections.ArrayList
 
## Create the Function
    function getMembership($group) {
        $searchGroup = Get-DistributionGroupMember $group -ResultSize Unlimited
        foreach ($member in $searchGroup) {
            if ($member.RecipientTypeDetails-match "Group" -and $member.PrimarySmtpAddress -ne "") {
                getMembership($member.PrimarySmtpAddress)
                }           
            else {
                if ($member.PrimarySmtpAddress -ne "") {
                    if (! $members.Contains($member.PrimarySmtpAddress) ) {
                        $members.Add($member.PrimarySmtpAddress) >$null
                        }
                    }
                }
            }
        }
 
## Run the function
    getMembership($group)
 
## Output results to screen
    $members.GetEnumerator() | sort-object

    

