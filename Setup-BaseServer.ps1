<#
.SYNOPSIS
    Configure a freshly-installed Windows Server OS.
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

Install-WindowsFeature -Name Windows-Server-Backup

Install-WindowsFeature -Name SNMP-Service -IncludeAllSubFeature

Set-TimeZone -id Central Standard Time