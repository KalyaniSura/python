$dir = "C:\test"
$ts = New-TimeSpan -Minutes 30
$latest = Get-ChildItem -path $dir -Filter '*.zip' | Where-Object { $_.LastWriteTime -gt ((Get-Date) - $ts) } 
Write-Host $latest.Count
if ($latest.Count -gt 0) {
 ForEach ($i in $latest){
    Write-Host $i
    copy-item -Path "C:\test\$i"-destination "C:\Users\rh985e\dest"
    expand-archive -path "C:\Users\rh985e\dest\$i" -destinationpath "C:\Users\rh985e\python" -Force
 }
 cd  "C:\Users\rh985e\python"
 git status
 git add .
 git commit -m "test"
 git push origin master
} else {
  Write-Host "NO New files"  
 }

