$server = 'config.23technology.com'
$lowervmname = $vmname.ToLower()
$certname = "$lowervmname.lab.school.lan"
$environment = 'school'
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
'runinterval = 1h' | add-content "C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf"
 
# Install WMF5
iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/TigerScript/bootstrap/master/installwmf5.ps1'))


