﻿# posh-choco
A powershell script to install [chocolatey](https://chocolatey.org) using https://chocolatey.org/install.ps1.  The `install.ps1` script will be downloaded, its checksum checked against the known checksum, and, if they are the same, executed.

Since _chocolatey_ doesn't provide a checksum of the file, instead, telling you to manually inspect the file before downloading/using, this script has the checksum of the current version of `install.ps1`.  If the checksum of the downloaded `install.ps1` do not match the current checksum, the two checksums will be displayed and nothing will be done.

The current `install.ps1` is included in this repo so that a diff can be done to compare the differences, should the downloaded `install.ps1` be different.

If the `install.ps1` on __chocolatey.org__ has been updated, this repo's `install.ps1` should be updated to reflect that change and the `install-chocolatey.ps1` script should be updated with the new checksum.

## Usage
Run `install-chocolatey.ps1` in Powershell as an administrator.  `Get-ExecutionPolicy` should be set to `Unrestricted`.  
https://raw.githubusercontent.com/mohae/posh-choco/master/install-chocolatey.ps1

## Checksum error
If the checksum's don't match, file an issue so that I can update the script with the new checksum for https://chocolatey.org/install.ps1.  Or better yet (for me), make a pull request!
