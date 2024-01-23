Install-Module -Name MSOnline
Connect-MsolService
$userList = Import-Csv -Path "C:\Users\nikhi\Downloads\FinalList.csv"

    
    foreach ($user in $userList) {
        $userPrincipalName = $user.FirstName + $user.LastName +"@nikhil9860.com" 

    
        $displayName = $user.DisplayName
        $role = $user.Role
        $password = $user.Password
        $phoneNumber = $user.PhoneNumber
        $FirstName = $user.FirstName
        $LastName = $user.LastName
        $AlternateEmail = $user.AlternateEmail
    
        #Create the user
        
        New-MsolUser -UserPrincipalName $userPrincipalName -DisplayName $displayName -FirstName $FirstName -LastName $LastName -Password $password -AlternateEmailAddresses $AlternateEmail 
        
        
        #Assign the admin role
        Add-MsolRoleMember -RoleMemberEmailAddress $userPrincipalName -RoleName $role  
      
    }





