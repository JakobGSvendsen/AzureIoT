#region Create a CloudClient
$CloudClientParams = @{
    iotConnString = "HostName=ev3dev.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=Jrsi9UGWfgm6Cwjmy3hBK2yU6ScRiKtuTZQ6U93Xn4M="
}
$cloudClient = Get-IoTCloudClient @CloudClientParams 
#$cloudClient    00:01:00         Microsoft.Azure.Devices.IotHubConnection            
#endregion

$commands = @{
 leftSpeed = 700 # 70% speed
 leftDuration = 3000 # 3 seconds
 rightSpeed = 700
 rightDuration = 3000

}

$commands = @{
    grabSpeed = 700 # 70% speed
    grabDuration = 1000 # 2 seconds
  
   }
#region send message from Cloud
$cloudMessageParams = @{
    deviceId = "mrrobot"
    messageString = $commands | convertto-json
    cloudClient = $cloudClient
}
Send-IoTCloudMessage @cloudMessageParams
#endregion