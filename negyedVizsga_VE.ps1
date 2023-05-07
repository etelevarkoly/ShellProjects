$gepnev = (Get-ComputerInfo).csname

Write-host "***************************"
Write-host "* Simple report"
Write-host "* Date: " (Get-Date)
Write-host "* Computer: $gepnev"
write-host "***************************"

Write-Host 'users with log-in entries: '
Get-LocalUser | Where-Object {$_.lastlogon} | Select-Object name , lastlogon | Format-table
# Get-LocalUser | Where-Object lastlogon -IS DateTime | Select-Object name, lastlogon | Format-Table
# Ez is jó megoldás, hogy csekkolom a lastlogon értékét, ha van neki, megy tovább.
# vagy az is jó, ha $null-ra vizsgálódunk:
# Get-LocalUser | Where-Object {$_.lastlogon -ne $null}

Write-host 'network adapters with ipv4 address: '
Get-NetIPConfiguration | Select-Object interfacealias, interfacedescription, ipv4address | Format-Table

Write-host 'top 5 process for cpu usage: '
Get-Process | Sort-Object CPU -Descending | Select-Object NAME, CPU, @{Name='WS';Expression={($_.WS/1MB)}} -First 5 | Format-Table
# WS a workingSet-et jelenti, ez a rövidítése annak, hogy 
# "set of pages in the virtual address space of the process that are currently resident in physical memory."
<#
(Get-Process).CPU
(Get-Process).TotalProcessorTime
a TotalProcessorTime jóval érthetőbben írja ki, konkrétan megjelölve a day,hour,minute stb értékeket.
#>

Write-Host 'End of report'
write-host '***************************'

# Format-Table legyen a végén, mert különben a display borulhat
# processnél /1MB lesz a megabyte. ha /1KB-tal osztom, akkor KB-ban írja ki