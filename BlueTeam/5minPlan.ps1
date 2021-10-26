#Chris Sequeira 
#Win10 blueteaming - secure HTTP, RDP assuming penetration
#ensure Score can read CDT{PRISON} from Contact.html
#ensure RDP from Score
#install sysinternals tools 

#Device deathrow (10.10.1.16) via yard (10.10.1.12)
#_________________________________________________________


#view processes paths, owner, and runtime (if infra is not suspended before comp)
Get-Process * -IncludeUserName | Format-Table Id, ProcessName, Path, UserName, StartTime
#kill proceses
#Stop-Process -ID PID -Force

#disconnect all established connections
Net Use * /delete

#change password
Set-LocalUser -Name Administrator -Password Apotheosik
Set-LocalUser -Name LocalGuard -Password Apotheosik

#show other users
Get-LocalUser | Select *

#turn on firewall
Set-NetFirewallProfile -All -Enabled True
#Explicitly defined allow rules will take precedence over the default block setting.
#Explicit block rules will take precedence over any conflicting allow rules.

#close all ports that aren't HTTP (80), RDP (x)
#Set-NetFirewallProfile -All -DefaultInboundAction Block
#Set-NetFirewallProfile -All -DefaultOutboundAction Block
#New-NetFirewallRule -DisplayName 'HTTP In' -Profile @('Domain', 'Private', 'Public') -Direction Inbound -Action Allow -Protocol TCP -LocalPort @('80', '443')

#turn on Windows Defender
Set-MpPreference -EnableeRealTimeMonitoring $true

#IIS Notes
#see inetmgr, logs in %SystemDrive%\inetpub\logs\LogFiles
#C:\ProgramFiles

#Turn off and back up IIS
Backup-WebConfiguration -Name IISFlagged

#reup 
#Restore-WebConfiguration -Name IISConfigBackup

#show processes 
netstat -ano

#review event log 
#check Recycle Bin, System Recycling 

#Disable PS2 (insecure)
Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

#view ps1 module (may be malicious) paths
Get-Module * -List | Foreach-Object Path

#configure local security policy, group policy management editor if possible 
#ugly if with powershell -> secedit 
