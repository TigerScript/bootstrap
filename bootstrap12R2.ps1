param 
(
	[String]$server="config.23technology.com",
	[String]$certname="dc1.23technology.com",
	[String]$environment="23technology"
)

#
# Install Chocolatey
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
# Install WMF5
iex ((new-object net.webclient).DownloadString('https://github.com/TigerScript/bootstrap/installwmf5.ps1'))

iex ((new-object net.webclient).DownloadString('http://go.microsoft.com/fwlink/?LinkId=717507'))

# Install Puppet
choco install puppet -y

# Create Puppet Config to point to configuration platform
'[main]' | set-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
'server = config.23technology.com' | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
'certname = dc1.23technology.cloud' | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
'environment = 23technology' | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
'pluginsync = true' | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
'autoflush = true' | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
'runinterval = 15m' | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
 
