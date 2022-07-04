$usbPath = Get-Location
$locat = "A18/A19"
$config ="myconfig.json"
$publicKey ="Principal_public_key.pem"
$installPath= "C:\Program Files\Veyon\"

CD $installPath
.\veyon-cli.exe networkobjects add location $locat
.\veyon-cli config import $usbPath +"\"+ $config
.\veyon-cli.exe authkeys import Principal/public $usbPath\$publicKey
Set-ExecutionPolicy -ExecutionPolicy Restricted -Force
Start-Sleep -Seconds 2
