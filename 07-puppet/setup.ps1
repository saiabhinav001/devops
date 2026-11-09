# Run PowerShell as Administrator. Chocolatey must already be installed.
$ErrorActionPreference = 'Stop'
choco --version
choco install puppet-agent -y
$puppet = 'C:\Program Files\Puppet Labs\Puppet\bin\puppet.bat'
& $puppet module install puppetlabs-chocolatey
# Apply the site.pp stored alongside this script.
& $puppet apply "$PSScriptRoot\site.pp"
# Open a new terminal after installation, then run: git --version
