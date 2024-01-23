$token = "3b5e2d13-9f65-437a-a1da-9daae82d02b9"

$open_id = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$token/.well-known/openid-configuration"

$token = $open_id.token_endpoint 

$body = @{

    client_id = "52dc70c4-cef8-4cfc-aab8-d974ba744270"
    client_secret = "Uya8Q~WkEXyGXziZKJWZ7Sqdq.3A~ywfx_Z9EbY2"
    redirect_uri = "https://localhost"
    grant_type = "client_credentials"
    resource = "https://graph.microsoft.com"
    tenant= "3b5e2d13-9f65-437a-a1da-9daae82d02b9"

}

Write-Host "Requesting access token"

$request = Invoke-RestMethod -Uri $token -Body $body -Method Post


$graph = "https://graph.microsoft.com/beta/users/Test2@nikhil9860.com"

#$graph = "https://graph.microsoft.com/v1.0/users/Test3@nikhil9860.com/memberOf/microsoft.graph.group?$select=displayName"


$api = Invoke-RestMethod -Headers @{Authorization="Bearer $($request.access_token)"} -Uri $graph -Method Get

$api














