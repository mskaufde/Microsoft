# Path to the hosts file
$hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"

# Remote URL of the text file containing the pre-prefixed URLs
$remoteUrlsFile = "https://example.com/urls.txt"

# Temporary local file to store the downloaded URLs
$tempUrlsFile = "$env:Temp\urls.txt"

# Download the file from the remote server
try {
    Invoke-WebRequest -Uri $remoteUrlsFile -OutFile $tempUrlsFile -UseBasicParsing
    Write-Output "Downloaded URLs file from $remoteUrlsFile"
} catch {
    Write-Output "Error: Unable to download URLs file. $_"
    exit 1
}

# Read the downloaded URLs
$urls = Get-Content $tempUrlsFile

# Backup the hosts file if not already backed up
if (-not (Test-Path "$hostsPath.bak")) {
    Copy-Item -Path $hostsPath -Destination "$hostsPath.bak" -Force
}

# Add entries to the hosts file if not already present
foreach ($url in $urls) {
    if (-not (Select-String -Path $hostsPath -Pattern "$url" -Quiet)) {
        Add-Content -Path $hostsPath -Value $url
    }
}

Write-Output "Hosts file updated successfully."
