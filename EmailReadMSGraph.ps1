$token = "3b5e2d13-9f65-437a-a1da-9daae82d02b9"

$open_id = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$token/.well-known/openid-configuration"

$token = $open_id.token_endpoint 

$body = @{

    client_id = "your client id"
    client_secret = "your client secret"
    redirect_uri = "https://localhost"
    grant_type = "client_credentials"
    resource = "https://graph.microsoft.com"
    tenant= "tenant id"
    scope = "https://graph.microsoft.com/Mail.Read"


}

Write-Host "Requesting access token"

$request = Invoke-RestMethod -Uri $token -Body $body -Method Post


$graph = "https://graph.microsoft.com/v1.0/users/nikhil@nikhil9860.com/messages"


$api = Invoke-RestMethod -Headers @{Authorization="Bearer $($request.access_token)"} -Uri $graph -Method Get
$api.value.subject













