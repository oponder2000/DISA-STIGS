<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Oliver Ponder
    LinkedIn        : https://www.linkedin.com/in/oliver-ponder/
    GitHub          : https://github.com/oponder2000
    Date Created    : 2026-04-06
    Last Modified   : 2026-04-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000032

.TESTED ON
    Date(s) Tested  : 2026-04-06
    Tested By       : Oliver Ponder
    Systems Tested  : Microsoft Windows 11 Pro 10.0.26200 N/A Build 26200
    PowerShell Ver. : 5.1.26100.7920

.USAGE
    Put any usage instructions here.
    Example syntax: 
    PS C:\> .\__remediation_template(WN11-00-000032).ps1 
#>

# Run as Administrator
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\MDOP\BitLocker\OsVolume"
$ValueName = "MinimumPinLength"
$ValueData = 6  # Can be 6 or greater

# Create the registry path if it doesn't exist
if (-not (Test-Path -Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the minimum PIN length value
New-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Registry value set successfully: MinimumPinLength = $ValueData"
