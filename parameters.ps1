# General Args
$prefix                 = 'demo_sxa'
$configsRoot            = Join-Path $PSScriptRoot 'configs'
$packagesRoot           = Join-Path $PSScriptRoot 'packages'
$licenseFilePath        = Join-Path $PSScriptRoot 'license.xml'
$sqlServer              = 'localhost'
$sqlServerAdminUser		= 'sa'
$sqlServerAdminPassword = 'blank'
$sitecoreVersion        = 'Sitecore 9.0.2 rev. 180604'
$xconnectCertificateName = "$prefix.xconnect"
$instanceNames = @{
    Sitecore = "${prefix}"
    XConnect = "${prefix}.xconnect"
}
$solr = @{
    Root            = 'c:\solr\solr-6.6.2\'
    Service         = 'solr-6.6.2'
}


### Sitecore ###

# Configre Sitecore Solr
$sitecoreSolr = @{
    Path                = Join-Path $configsRoot sitecore-solr.json
    SolrRoot            = $solr.Root
    SolrService         = $solr.Service
    CorePrefix          = $prefix
}

# Install Sitecore
$sitecore = @{
    Path                = Join-Path $configsRoot sitecore-xm0.json
    Package             = Join-Path $packagesRoot "$sitecoreVersion (OnPrem)_cm.scwdp.zip"
    LicenseFile         = $licenseFilePath
    SqlDbPrefix         = $prefix
    SolrCorePrefix      = $prefix
    SiteName            = $instanceNames.Sitecore
    SqlServer           = $sqlServer
	SqlAdminUser		= $sqlServerAdminUser
	SqlAdminPassword	= $sqlServerAdminPassword
}

### Modules ###

# Install PowerShell extensions
$powershellExtensions = @{
	Path 		= Join-Path $configsRoot install-package.json
	Package 	= Join-Path $packagesRoot 'Sitecore PowerShell Extensions-4.7.2 for Sitecore 8.zip'
	SiteName	= $prefix
}

# Install SXA
$sxa = @{
	Path 		= Join-Path $configsRoot install-package.json
	Package 	= Join-Path $packagesRoot 'Sitecore Experience Accelerator 1.7.1 rev. 180604 for 9.0.zip'
	SiteName	= $prefix
}