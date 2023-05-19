try{

$usblist = gwmi win32_volume | where{$_.DriveType -eq '2'}
$PNP = Get-PnpDevice -Class ("WPD") | where {$_.Status -eq "OK" -and $_.InstanceId -like "*USB\VID*"}
$hddDevs = Get-CimInstance -ClassName Win32_DiskDrive 
$externalDisks = $hddDevs | Where {$_.MediaType -like "*External*"}
$driverletter = $usblist.Name
$Eject =  New-Object -comObject Shell.Application


if($usblist){
foreach($drive in $driverletter){

Write-Host "Removing" $drive
$Eject.NameSpace(17).ParseName($drive).InvokeVerb("Eject")
Start-Sleep(2)

}


}if($PNP) {

foreach($PNPdevice in $PNP){ 

pnputil /disable-device $PNPdevice.InstanceId
pnputil /remove-device $PNPdevice.InstanceId
Start-Sleep(2)
 
}

}if($externalDisks){

foreach($externalHDD in $externalDisks){ 

pnputil /remove-device $externalHDD.PNPDeviceID
Start-Sleep(2)
 
}


}
 
 
}

catch{

Write-Host "Error, Unable to remove USB device"

}
