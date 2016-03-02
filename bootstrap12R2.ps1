Write-Host '#################################################################################'
Write-Host 'This script bootstraps the Windows server to be managed by Puppet and Chocolatey'
Write-Host '#################################################################################'
Write-Host 'You are required to enter the Configuration Server FQDN, The (unique) name of the'
Write-Host 'certificate to create to identify this server and the environment (client) name..'
Write-Host ''
$server = Read-Host -prompt 'Enter Configuration Server Name'
$certname = Read-Host -Prompt 'Enter Certificate Name'
$environment = Read-Host -Prompt 'Enter Environment Name'
Write-Host ''
Write-Host 'Thanks.   The script will now install Chocolatey, WMF5 and Puppet'
Write-Host '#################################################################################'

#
# Install Chocolatey
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
# Install Puppet
choco install puppet -y

# Create Puppet Config to point to configuration platform
'[main]' | set-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
"server = $server" | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
"certname = $certname" | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
"environment = $environment" | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
'pluginsync = true' | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
'autoflush = true' | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
'runinterval = 15m' | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
 
# Install WMF5
iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/TigerScript/bootstrap/master/installwmf5.ps1'))

restart-computer

