$setupPath = ".\veyon-4.7.3.0-win64-setup.exe"
Invoke-expression "$setupPath /S /nomaster"
echo "Done"
Start-Sleep -Seconds 2