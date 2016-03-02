# bootstrap

This Repo is used to Bootstrap a Windows Environment with Puppet and Chocolatey

Simply run the powershell below as an administrator and follow the prompts for 
setting the Puppet server, Agent Cert name and Environment name.


iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/TigerScript/bootstrap/master/bootstrap12R2.ps1'))
