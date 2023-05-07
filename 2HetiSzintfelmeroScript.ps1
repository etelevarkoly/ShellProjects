$path = 'C:\Users\user\Desktop\ASD\powershell'
$username = $env:USERNAME
$pcManufact = (Get-ComputerInfo).CsManufacturer
$cpu = (Get-ComputerInfo).csprocessors.name
$biosFirmware = (Get-ComputerInfo).biosfirmwaretype

Write-Output 'username:'$username | Out-File $path\2hetiszintfelmero.txt
Write-Output 'Computer Manufacturer:' $compManufact | Out-File -Append $path\2hetiszintfelmero.txt
Write-Output 'Processor:' $cpuName | Out-File -Append $path\2hetiszintfelmero.txt
Write-Output 'BIOS Firmware Type:' $biosFirmware | Out-File -Append $path\2hetiszintfelmero.txt

$date1 = Get-Date "2022.01.01."
$date2 = Get-Date

$dateSubstract = $date2 - $date1
Write-Output 'dátum1:'$date1 | Out-File -Append $path\2hetiszintfelmero.txt
Write-Output 'dátum2:'$date2 | Out-File -Append $path\2hetiszintfelmero.txt
Write-Output 'a két dátum között eltelt napok száma:' $dateSubstract.Days | Out-File -Append $path\2hetiszintfelmero.txt

$dateInput = Read-Host 'írj be egy dátumot(yyyy.mm.dd):'
if ($dateInput = $dateInput -as [datetime]) {
    Write-Output 'a megadott dátum:'$dateInput | Out-File -Append $path\2hetiszintfelmero.txt
    Write-Output 'megadott dátum + 90 nap:'($dateInput).adddays(90) | Out-File -Append $path\2hetiszintfelmero.txt
    Write-Output 'megadott dátum + 180 nap:'($dateInput).adddays(180) | Out-File -Append $path\2hetiszintfelmero.txt
}
else {
    Write-Output 'a megadott dátum nem helyes' | Out-File -Append $path\2hetiszintfelmero.txt
}

$diskTotalSize = (Get-Disk).Size
$diskPartitionStyle = (Get-Disk).PartitionStyle

$partitionLetter = Get-partition -DriveLetter C

Write-Output 'disk total size in bytes:'$diskTotalSize | Out-File -Append $path\2hetiszintfelmero.txt
Write-Output 'disk partition style:'$diskPartitionStyle | Out-File -Append $path\2hetiszintfelmero.txt
Write-Output "My main partition's letter:" $partitionInfo.DriveLetter | Out-File -Append $path\2hetiszintfelmero.txt


# -------------------------------

<#
$systemInfoHash = @{ username = $env:USERNAME; path = 'C:\Users\user\Desktop\ASD\powershell'; `
pcManufact = (Get-ComputerInfo).CsManufacturer; cpu = (Get-ComputerInfo).csprocessors.name; `
biosFirmware = (Get-ComputerInfo).biosfirmwaretype; dateInput = Read-Host 'írj be egy dátumot(yyyy.mm.dd):'; `
diskTotalSize = (Get-Disk).Size; diskPartitionStyle = (Get-Disk).PartitionStyle; `
partitionLetter = Get-partition -DriveLetter C}

foreach ($i in $systemInfoHash.GetEnumerator()) {
    Write-Host "$($i.Name) : $($i.Value)"
}

HASHTÁBLÁBAN nem lehet változót megadni KEY-nek, ezért a dátumos részt nem tudnám megoldani.

#>