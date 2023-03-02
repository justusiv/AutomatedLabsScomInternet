
New-LabDefinition -Name ScomDev -DefaultVirtualizationEngine HyperV

$PSDefaultParameterValues = @{
    'Add-LabMachineDefinition:OperatingSystem' = 'Windows Server 2019 Datacenter (Desktop Experience)'
    'Add-LabMachineDefinition:DomainName'      = 'contoso.com'
    'Add-LabMachineDefinition:Memory'          = 2GB
    'Add-LabMachineDefinition:Tools'          = "$labsources\Tools"
}

#####setup networking
Add-LabVirtualNetworkDefinition -Name 'ScomDev'
Add-LabVirtualNetworkDefinition -Name 'Default Switch' -HyperVProperties @{ SwitchType = 'External'; AdapterName = 'Ethernet' }
#Add-LabMachineDefinition -Name DC1 -Memory 1GB -OperatingSystem 'Windows Server 2016 Datacenter (Desktop Experience)' -Roles RootDC -Network Lab0 -DomainName contoso.com
$netAdapter = @()
$netAdapter += New-LabNetworkAdapterDefinition -VirtualSwitch ScomDev
$netAdapter += New-LabNetworkAdapterDefinition -VirtualSwitch 'Default Switch' -UseDhcp
#Add-LabMachineDefinition -Name Router1 -Memory 1GB -OperatingSystem 'Windows Server 2019 Datacenter (Desktop Experience)' -Roles Routing -NetworkAdapter $netAdapter -DomainName contoso.com
#####setup networking


# Define the domain environment
Add-LabDomainDefinition -Name contoso.com -AdminUser Install -AdminPassword Somepass1
Set-LabInstallationCredential -Username Install -Password Somepass1

# Add your ISOs - Update this to your values!
Add-LabIsoImageDefinition -Name SQLServer2017 -Path $labsources\ISOs\en_sql_server_2017_enterprise_x64_dvd_11293666.iso
Add-LabIsoImageDefinition -Name ScomManagement -Path $labsources\ISOs\mu_system_center_operations_manager_2019_x64_dvd_b3488f5c.iso


# Basic Root Domain Controller and SQL 2017 Server, including SSRS and SSMS
Add-LabMachineDefinition -Name SCDC1 -Memory 2GB -Roles RootDc,Routing -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)' -NetworkAdapter $netAdapter
Add-LabMachineDefinition -Name SCDB1 -Memory 8GB -Roles SQLServer2017,ScomReporting -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)' -Network 'ScomDev'

# Add as many role VMs as desired. These can all be installed on a single VM as well.
Add-LabMachineDefinition -Name SCMG1 -Memory 8GB -Role ScomManagement,ScomConsole -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)' -Network 'ScomDev'
Add-LabMachineDefinition -Name SCMG2 -Memory 8GB -Role ScomManagement,ScomConsole -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)' -Network 'ScomDev'
Add-LabMachineDefinition -Name SCWC1 -Memory 8GB -Role ScomWebConsole -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)' -Network 'ScomDev'
Add-LabMachineDefinition -Name SCCL1 -Memory 8GB -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)' -Network 'ScomDev'

Install-Lab
Show-LabDeploymentSummary -Detailed



###########################################################################

New-LabDefinition -Name ScomDev -DefaultVirtualizationEngine HyperV

$PSDefaultParameterValues = @{
    'Add-LabMachineDefinition:OperatingSystem' = 'Windows Server 2019 Standard (Desktop Experience)'
    'Add-LabMachineDefinition:DomainName'      = 'contoso.com'
    'Add-LabMachineDefinition:Memory'          = 2GB
    'Add-LabMachineDefinition:Tools'          = "$labsources\Tools"
}

# Define the domain environment
Add-LabDomainDefinition -Name contoso.com -AdminUser Install -AdminPassword Somepass1
Set-LabInstallationCredential -Username Install -Password Somepass1

# Add your ISOs - Update this to your values!
Add-LabIsoImageDefinition -Name SQLServer2017 -Path $labsources\ISOs\en_sql_server_2017_enterprise_x64_dvd_11293666.iso
Add-LabIsoImageDefinition -Name ScomManagement -Path $labsources\ISOs\mu_system_center_operations_manager_2019_x64_dvd_b3488f5c.iso

# Basic Root Domain Controller and SQL 2017 Server, including SSRS and SSMS
Add-LabMachineDefinition -Name SCDC1 -Memory 2GB -Roles RootDc -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)'
Add-LabMachineDefinition -Name SCDB1 -Memory 8GB -Roles SQLServer2017,ScomReporting -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)'

# Add as many role VMs as desired. These can all be installed on a single VM as well.
Add-LabMachineDefinition -Name SCMG1 -Memory 8GB -Role ScomManagement,ScomConsole -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)'
Add-LabMachineDefinition -Name SCWC1 -Memory 8GB -Role ScomWebConsole -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)'

Install-Lab
Show-LabDeploymentSummary -Detailed






#################################################################Provided script###############
New-LabDefinition -Name ScomDev -DefaultVirtualizationEngine HyperV

$PSDefaultParameterValues = @{
    'Add-LabMachineDefinition:OperatingSystem' = 'Windows Server 2019 Standard (Desktop Experience)'
    'Add-LabMachineDefinition:DomainName'      = 'contoso.com'
    'Add-LabMachineDefinition:Memory'          = 2GB
    'Add-LabMachineDefinition:Tools'          = "$labsources\Tools"
}

# Define the domain environment
Add-LabDomainDefinition -Name contoso.com -AdminUser Install -AdminPassword Somepass1
Set-LabInstallationCredential -Username Install -Password Somepass1

# Add your ISOs - Update this to your values!
Add-LabIsoImageDefinition -Name SQLServer2017 -Path $labsources\ISOs\en_sql_server_2017_enterprise_x64_dvd_11293666.iso
Add-LabIsoImageDefinition -Name ScomManagement -Path $labsources\ISOs\mu_system_center_operations_manager_2019_x64_dvd_b3488f5c.iso


# Basic Root Domain Controller and SQL 2017 Server, including SSRS and SSMS
Add-LabMachineDefinition -Name SCDC1 -Memory 2GB -Roles RootDc -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)'
Add-LabMachineDefinition -Name SCDB1 -Memory 8GB -Roles SQLServer2017,ScomReporting -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)'

# Add as many role VMs as desired. These can all be installed on a single VM as well.
Add-LabMachineDefinition -Name SCMG1 -Memory 8GB -Role ScomManagement,ScomConsole -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)'
Add-LabMachineDefinition -Name SCMG2 -Memory 8GB -Role ScomManagement,ScomConsole -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)'
Add-LabMachineDefinition -Name SCWC1 -Memory 8GB -Role ScomWebConsole -Domain contoso.com -OperatingSystem 'Windows Server 2019 Standard (Desktop Experience)'

Install-Lab
Show-LabDeploymentSummary -Detailed