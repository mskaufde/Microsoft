# Check if the script is running with administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Relaunch the script as an administrator
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-File", $MyInvocation.MyCommand.Path
    # Exit the current session
    Exit
}

$folderPath = ""C:\Program Files\Adobe\Adobe After Effects 2023"

# Create outbound rules for executables in the folder
Get-ChildItem -Path $folderPath -Filter *.exe -Recurse | ForEach-Object {
    New-NetFirewallRule -DisplayName "Block_Outbound_$($_.Name)" -Direction Outbound -Action Block -Program $_.FullName
}

# Create inbound rules for executables in the folder
Get-ChildItem -Path $folderPath -Filter *.exe -Recurse | ForEach-Object {
    New-NetFirewallRule -DisplayName "Block_Inbound_$($_.Name)" -Direction Inbound -Action Block -Program $_.FullName
}
