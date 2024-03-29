﻿[Environment]::CurrentDirectory = (Get-Location -PSProvider FileSystem).ProviderPath

$file = "dedicated_server.exe"
$exehash = Get-FileHash $file -Algorithm "SHA256"
echo $exehash
If ($exeHash.Hash -ne "058FDB1A32950A4BE9B22E22D95457B8A5FCC062748E714E8D27E85110458124")
{
write-host Hash Check FAIL
exit
}

write-host Hash Check Passed
$irBt = Read-Host "IR Missile Build time (Seconds)"
$irBtHex = '0x{0:X}' -f ([byte]$irBt)
$lsrBt = Read-Host "LSR Missile Build time (Seconds)"
$lsrBtHex = '0x{0:X}' -f ([byte]$lsrBt)
$aaBt = Read-Host "AA Missile Build time (Seconds)"
$aaBtHex = '0x{0:X}' -f ([byte]$aaBt)
$tvBt = Read-Host "TV Missile Build time (Seconds)"
$tvBtHex = '0x{0:X}' -f ([byte]$tvBt)
$torpBt = Read-Host "Torpedo (All) Build time (Seconds)"
$torpBtHex = '0x{0:X}' -f ([byte]$torpBt)
$cruBt = Read-Host "Cruise Missile Build time (Seconds)"
$cruBtHex = '0x{0:X}' -f ([byte]$cruBt)
$flrBt = Read-Host "Flare Build time (Seconds)"
$flrBtHex = '0x{0:X}' -f ([byte]$flrBt)
$20mBt = Read-Host "20mm Build time (Seconds)"
$20mBtHex = '0x{0:X}' -f ([byte]$20mBt)
$40mBt = Read-Host "40mm Build time (Seconds)"
$40mBtHex = '0x{0:X}' -f ([byte]$40mBt)
$100mBt = Read-Host "100mm Build time (Seconds)"
$100mBtHex = '0x{0:X}' -f ([byte]$100mBt)
$120mBt = Read-Host "120mm Build time (Seconds)"
$120mBtHex = '0x{0:X}' -f ([byte]$120mBt)
$160mBt = Read-Host "160mm Build time (Seconds)"
$160mBtHex = '0x{0:X}' -f ([byte]$160mBt)

echo 'Debug (Show Hex)',$irBtHex,$lsrBtHex,$aaBtHex,$tvBtHex,$torpBtHex,$flrBtHex,$20mBtHex,$40mBtHex,$100mBtHex,$120mBtHex,$160mBtHex

$bytes  = [System.IO.File]::ReadAllBytes($file)
$irOffset = 422850
$lsrOffset = 422952
$aaOffset = 423054
$tvOffset = 423462
$torpOffset = 423156
$torpNoiOffset = 423258
$torpCntOffset = 423360
$cruOffset = 425211
$flrOffset = 425412
$20mOffset = 425511
$40mOffset = 425112
$100mOffset = 425610
$120mOffset = 425709
$160mOffset = 425808


$bytes[$irOffset] = $irBtHex
$bytes[$lsrOffset] = $lsrBtHex
$bytes[$aaOffset] = $aaBtHex
$bytes[$tvOffset] = $tvBtHex
$bytes[$torpOffset] = $torpBtHex
$bytes[$torpNoiOffset] = $torpBtHex
$bytes[$torpCntOffset] = $torpBtHex
$bytes[$cruOffset] = $cruBtHex
$bytes[$flrOffset] = $flrBtHex
$bytes[$20mOffset] = $20mBtHex
$bytes[$40mOffset] = $40mBtHex
$bytes[$100mOffset] = $100mBtHex
$bytes[$120mOffset] = $120mBtHex
$bytes[$160mOffset] = $160mBtHex

write-host Writing modded file CC2_Mod.exe
[System.IO.File]::WriteAllBytes("CC2_Mod.exe", $bytes)
pause
