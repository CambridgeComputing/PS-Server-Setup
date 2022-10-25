<#
.SYNOPSIS
    Configure a Windows Server for the role of Hyper-V host.
.DESCRIPTION
    todo
.NOTES
    Repository: https://github.com/CambridgeComputing/PS-Server-Setup
    Author: Dennis McDonald
.LINK
    https://github.com/CambridgeComputing/PS-Server-Setup
.EXAMPLE
    todo
#>

# Install and setup defaults
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools
Set-VMHost -VirtualMachinePath "D:\" -VirtualHardDiskPath "D:\" -MaximumVirtualMachineMigrations 4 -MaximumStorageMigrations 4 -VirtualMachineMigrationAuthenticationType CredSSP -VirtualMachineMigrationPerformanceOption SMB
Set-VMReplicationServer $true -AllowedAuthenticationType Kerberos -ReplicationAllowedFromAnyServer $true

# Setup Networking. Requires a network adapter "Trunk" in its name.
New-VMSwitch "Trunk" -EnableIov -NetAdapterName (Get-NetAdapter | Where-Object {$_.Name -like "*trunk*"}).Name -AllowManagementOS $false
