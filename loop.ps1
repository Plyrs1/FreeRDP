$i = 360
do {
    Start-Process '.\rclone\rclone.exe' '--config rclone.conf bisync googledrive: D:\RDP' 
    Start-Process 'ICACLS' 'D:\RDP\* /grant FreeRDP:F /t'
    Write-Host "[+] Checking ngrok... $i"
    Get-Process -Name 'ngrok'
    Write-Host '[+] IP   :' ((Invoke-WebRequest -Uri http://localhost:4040/api/tunnels -ContentType "application/json").Content | ConvertFrom-Json).tunnels[0].public_url
    Sleep 60
    $i--
} while ($i -gt 0)
