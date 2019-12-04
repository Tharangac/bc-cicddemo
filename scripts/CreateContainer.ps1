$username = $env:DOCKERUSER
$password = ConvertTo-SecureString -String $env:DOCKERPASSWORD -AsPlainText -Force
$credential = New-Object PSCredential -ArgumentList $username, $password
$licenseFile = $env:LICENSE_SECUREFILEPATH

$segments = "$PSScriptRoot".Split('\')
$rootFolder = "$($segments[0])\$($segments[1])"
$additionalParameters = @("--volume ""$($rootFolder):C:\agent""")

New-NavContainer `
    -containerName $env:CONTAINERNAME `
    -accept_eula `
    -auth NavUserPassword `
    -Credential $credential `
    -imageName $env:DOCKERIMAGE `
    -licenseFile $licenseFile `
    -memoryLimit 4G `
    -shortcuts Desktop `
    -updateHosts `
    -doNotExportObjectsToText `
    -doNotCheckHealth `
    -EnableTaskScheduler:$false `
    -additionalParameters $additionalParameters