Set-ExecutionPolicy Bypass -Scope Process

# Enter a script or file to execute below
$AfterRebootExec = ""


# Install IIS
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-WebServerRole
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-WebServer
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ApplicationDevelopment
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ApplicationInit
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-CommonHttpFeatures
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-DefaultDocument
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-DirectoryBrowsing
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-HealthAndDiagnostics
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-HttpCompressionStatic
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-HttpErrors
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-HttpLogging
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-HttpRedirect
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-IIS6ManagementCompatibility
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ISAPIExtensions
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ISAPIFilter
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-LegacySnapIn
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ManagementConsole
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-Metabase
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName NetFx4Extended-ASPNET45
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-NetFxExtensibility45
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-Performance
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-RequestFiltering
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-Security
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-StaticContent
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-WebServerManagementTools
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName IIS-ASPNET45
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName WAS-WindowsActivationService
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName WAS-ProcessModel
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName WAS-ConfigurationAPI
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName MSMQ
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName MSMQ-Services
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName MSMQ-Server
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName WCF-HTTP-Activation45
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName WCF-TCP-Activation45
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName WCF-Pipe-Activation45
Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName WCF-MSMQ-Activation45

# Add AV Exclusions
Add-MpPreference -ExclusionPath "C:\inetpub\temp\IIS Temporary Compressed Files"
Add-MpPreference -ExclusionProcess "C:\Windows\system32\inetsrv\w3wp.exe"
Add-MpPreference -ExclusionProcess "C:\Windows\SysWOW64\inetsrv\w3wp.exe"
Add-MpPreference -ExclusionPath "C:\Windows\Microsoft.NET\Framework\v2.0.50727\CONFIG"
Add-MpPreference -ExclusionPath "C:\Windows\Microsoft.NET\Framework64\v2.0.50727\CONFIG"
Add-MpPreference -ExclusionPath "C:\Windows\Microsoft.NET\Framework\v4.0.30319\Config"
Add-MpPreference -ExclusionPath "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config"
Add-MpPreference -ExclusionPath "C:\Windows\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files"
Add-MpPreference -ExclusionPath "C:\Windows\Microsoft.NET\Framework64\v2.0.50727\Temporary ASP.NET Files"
Add-MpPreference -ExclusionPath "C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files"
Add-MpPreference -ExclusionPath "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files"
Add-MpPreference -ExclusionPath "%SystemDrive%\Windows\System32\inetsrv\config\"
Add-MpPreference -ExclusionPath "%SystemRoot%\IIS Temporary Compressed Files"
Add-MpPreference -ExclusionPath "%SystemDrive%\inetpub\temp\IIS Temporary Compressed Files"
Add-MpPreference -ExclusionPath "%SystemDrive%\inetpub\temp\ASP Compiled Templates"
Add-MpPreference -ExclusionPath "%systemDrive%\inetpub\logs"
Add-MpPreference -ExclusionProcess "%SystemRoot%\system32\inetsrv\w3wp.exe"
Add-MpPreference -ExclusionProcess "%SystemRoot%\SysWOW64\inetsrv\w3wp.exe"
Add-MpPreference -ExclusionProcess "%SystemDrive%\PHP5433\php-cgi.exe"

# Set RunOnce Action
$RunOnceKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
if ( $AfterRebootExec.Length -gt 0 )
    {
        #set-itemproperty $RunOnceKey "NextRun" ($RunOnceAction)
    }

# Restart
Restart-Computer