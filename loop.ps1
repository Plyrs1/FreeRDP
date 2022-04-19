$i = 360
do {
    Start-Process '.\rclone\rclone.exe' '--config rclone.conf bisync googledrive: D:\RDP' 
    Start-Process 'ICACLS' 'D:\RDP /grant FreeRDP:F'
    Write-Host $i
    Sleep 60
    $i--
} while ($i -gt 0)
