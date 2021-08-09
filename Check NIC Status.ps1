#Ping 1.1.1.1 And Store That Information/Result In A Variable.
$testnetworkconnection = Test-NetConnection -ComputerName 1.1.1.1 -InformationLevel Detailed
#Run The Stored Variable Against An If Statement. If The Statement Is Not Equel To A True Value Then Run The Command To Restart All Network Adapters.
if ($testnetworkconnection.PingSucceeded -ne "True" ) {Restart-NetAdapter -Name *}


#One Liner To Achieve The Same Results. You Can Replace The Destination IP Address With Any Desired.
#You Can Also Get The Name Of The Desire Network Interface Card (NIC) with The Command (Get-netadapter) And Replace As Desired.
Test-NetConnection -ComputerName 1.1.1.1 -InformationLevel Detailed || Restart-NetAdapter -Name *
