$setupPath = "veyon-4.7.3.0-win64-setup"
powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"
$setupPath /S /nomaster
