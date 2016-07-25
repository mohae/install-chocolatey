# Install chocolatey: must run powershell as administrator.
# For some reason, chocolatey.org doesn't supply a checksum for install.ps1.
# As such, please inspect https://chocolatey.org/install.ps1 first.
# For more info: https://chocolatey.org/install

# SHA256 of install.ps1 as of 7/25/2006:
$sha256 =  'D5CC8047349C9C153AF39A05224E0A6488B0BB054E08FAC2C5789800F94519F8'
# output dest
$output = Join-Path $Home "\Downloads\install-chocolatey.ps1"
# url of install script
$url = 'https://chocolatey.org/install.ps1'

$wc = New-Object System.Net.WebClient
$wc.UseDefaultCredentials = $true
$wc.Headers.Add("X-FORMS_BASED_AUTH_ACCEPTED", "f")
$wc.DownloadFile($url, $output)

Write-Output "$url downloaded as $output"

# check hash
$fhash = Get-FileHash $output
if (-NOT ($($fhash.Hash) -eq $sha256)) {
    Write-Output "The downloaded script's SHA256, $($fhash.Hash), is not equal to the expected value: $sha256."
    exit
}

Invoke-Expression $output
